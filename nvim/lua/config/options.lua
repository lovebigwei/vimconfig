-- ~/.config/nvim/lua/config/options.lua

-- Encoding
-- Neovim already uses UTF-8 by default, but these are safe.
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Tabs/spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Text width
vim.opt.textwidth = 500

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight matching braces
vim.opt.showmatch = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Allow hidden modified buffers
vim.opt.hidden = true

-- Completion
vim.opt.completeopt:remove("preview")

vim.opt.background = "dark"

-- ripgrep for :grep
vim.opt.grepprg = "rg --vimgrep --smart-case --follow"

-- Search path
vim.opt.path:append("~/workspace/perception_2025")
vim.opt.path:append("~/workspace/perception_2025/python")
vim.opt.path:append("/home/qxz4b0b/workspace/IKS_DEBUG/kpi-scripts/src")

-- Command-line completion style
vim.opt.wildmode = { "longest", "list" }

-- True color
if vim.env.TERM_PROGRAM ~= "Apple_Terminal" then
  vim.opt.termguicolors = true
end

-- Optional clipboard.
-- Uncomment if you want system clipboard integration.
-- vim.opt.clipboard = "unnamedplus"

