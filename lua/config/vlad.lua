-- Local tweaks (kept separate from upstream defaults)

-- Disable snacks by choosing alternative picker and explorer
-- vim.g.lazyvim_picker = "telescope" -- or "fzf"
-- vim.g.lazyvim_explorer = "neo-tree" -- or another explorer

vim.opt.eventignore = { "SwapExists" }
vim.opt.mouse = ""

-- Display settings: reduce left gutter and use absolute numbers
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = false -- Disable relative numbers
vim.opt.signcolumn = "no"      -- Disable signcolumn (left gutter)
vim.opt.statuscolumn = ""      -- Disable custom statuscolumn, use default

-- Disable autoformat on save
vim.g.autoformat = false -- Fully disable autoformat

-- Sudo write command (kept as reference)
-- vim.cmd("command! W execute ':silent w !sudo tee % > /dev/null' | :edit!")
-- vim.api.nvim_create_user_command("W", function()
--   vim.cmd("silent write !sudo tee % > /dev/null")
--   vim.bo.modified = false
-- end, { desc = "Write file with sudo" })
-- vim.api.nvim_create_user_command(
--   "W",
--   function()
--     vim.cmd("silent write !sudo tee % > /dev/null")
--     vim.cmd("edit!")
--   end,
--   { desc = "Write file with sudo" }
-- )
-- if vim.fn.has("unix") == 1 then
--   vim.api.nvim_create_user_command("W", function()
--     local file = vim.fn.expand("%")
--     if file == "" then
--       vim.notify("No file name", vim.log.levels.ERROR)
--       return
--     end
--     vim.cmd("silent write !sudo tee % > /dev/null")
--     vim.cmd("edit!")
--     vim.notify("File saved with sudo permissions", vim.log.levels.INFO)
--   end, {})
-- end
