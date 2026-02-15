return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- Переопределяем colorscheme, чтобы отключить tokyonight
      -- Можно установить другую тему или оставить пустую функцию
      -- colorscheme = "default", -- или можно использовать функцию: colorscheme = function() end
      colorscheme = "lunaperche" -- default", -- или можно использовать функцию: colorscheme = function() end
    },
  },
  -- Отключаем snacks плагин
  {
    "folke/snacks.nvim",
    enabled = false,
  },
}

