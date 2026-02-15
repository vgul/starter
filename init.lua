-- bootstrap lazy.nvim, LazyVim and your plugins

-- Заглушка для Snacks, чтобы избежать ошибок при отключенном плагине
-- Это нужно, т.к. LazyVim использует Snacks напрямую в некоторых местах
if not package.loaded["snacks"] then
  -- Создаём таблицу, которая может быть вызвана как функция и имеет поле other
  local bufdelete_table = setmetatable({
    other = function()
      vim.cmd("bufdo bd")
    end,
  }, {
    __call = function()
      vim.cmd("bd")
    end,
  })

  -- Функция для создания объекта с методом map, поддерживающим цепочку вызовов
  local function create_map_object()
    local map_obj = {}
    map_obj.map = function(key)
      if type(key) == "string" then
        -- Создаём пустую keymap
        vim.keymap.set("n", key, function() end, { desc = "Toggle" })
      end
      -- Возвращаем объект для цепочки вызовов
      return create_map_object()
    end
    return map_obj
  end

  -- Создаём toggle, который может быть и функцией, и таблицей
  local toggle_table = {
    option = function() return create_map_object() end,
    diagnostics = function() return create_map_object() end,
    line_number = function() return create_map_object() end,
    treesitter = function() return create_map_object() end,
    dim = function() return create_map_object() end,
    animate = function() return create_map_object() end,
    indent = function() return create_map_object() end,
    scroll = function() return create_map_object() end,
    profiler = function() return create_map_object() end,
    profiler_highlights = function() return create_map_object() end,
    inlay_hints = function() return create_map_object() end,
    zoom = function() return create_map_object() end,
    zen = function() return create_map_object() end,
  }
  -- Делаем toggle вызываемым как функция
  setmetatable(toggle_table, {
    __call = function(_, opts)
      -- Snacks.toggle может быть вызван как функция с опциями
      -- Возвращаем объект с методом map для keymaps
      local map_obj = {}
      map_obj.map = function(key)
        -- Убеждаемся, что key - это строка
        if type(key) == "string" then
          -- Просто создаём пустую keymap, т.к. функционал не нужен
          vim.keymap.set("n", key, function() end, { desc = opts and opts.name or "Toggle" })
        end
        -- Возвращаем объект для цепочки вызовов
        return create_map_object()
      end
      return map_obj
    end,
  })

  _G.Snacks = {
    keymap = {
      set = function(mode, lhs, rhs, opts)
        -- Фильтруем опции, которые не поддерживаются vim.keymap.set
        -- (например, ft, has и другие опции lazy.nvim)
        if opts then
          local filtered_opts = {}
          local allowed_opts = {
            buffer = true,
            desc = true,
            expr = true,
            noremap = true,
            remap = true,
            script = true,
            silent = true,
            nowait = true,
            unique = true,
          }
          for k, v in pairs(opts) do
            if allowed_opts[k] then
              filtered_opts[k] = v
            end
          end
          opts = filtered_opts
        end
        return vim.keymap.set(mode, lhs, rhs, opts)
      end,
    },
    bufdelete = bufdelete_table,
    toggle = toggle_table,
    picker = {
      git_log = function() end,
      git_log_line = function() end,
      git_log_file = function() end,
    },
    gitbrowse = function() end,
    terminal = function() end,
    lazygit = function() end,
    debug = {
      run = function() end,
    },
  }
end

require("config.lazy")
