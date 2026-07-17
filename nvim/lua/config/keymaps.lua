-- ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set

-- Toggle paste mode with F5.
-- Usually not needed in modern Neovim terminals, but kept from your vimrc.
map("n", "<F5>", function()
  vim.opt.paste = not vim.opt.paste:get()
  print("paste mode: " .. tostring(vim.opt.paste:get()))
end, { desc = "Toggle paste mode" })

-- Switch between .h and .cpp
map("n", "<F4>", "<cmd>e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>", {
  desc = "Switch header/source",
})

-- Command-line expansions
map("c", "%%", function()
  if vim.fn.getcmdtype() == ":" then
    return vim.fn.expand("%:h") .. "/"
  end
  return "%%"
end, { expr = true, desc = "Expand current file directory" })

map("c", "%p", function()
  if vim.fn.getcmdtype() == ":" then
    return vim.fn.expand("%:p")
  end
  return "%p"
end, { expr = true, desc = "Expand current file path" })

-- Find file relative to current directory
map("n", "<leader>f", ":find %%",{ remap=true, desc = "Find from current file directory" })

-- fzf.vim files
map("n", "f<C-f>", "<cmd>Files<CR>", { silent = true, desc = "FZF Files" })

-- Toggle relative line number
map("n", "<leader>tn", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative line number" })

-- Buffer mappings
map("n", "bl", "<cmd>ls<CR>", { silent = true, desc = "List buffers" })
map("n", "bo", "<cmd>enew<CR>", { silent = true, desc = "New buffer" })
map("n", "bn", "<cmd>bnext<CR>", { silent = true, desc = "Next buffer" })
map("n", "bp", "<cmd>bprevious<CR>", { silent = true, desc = "Previous buffer" })
map("n", "bd", ":ls<CR>:bwipeout!<Space>", { desc = "Wipe buffer" })
map("n", "<leader>b", ":ls<CR>:b<Space>", { desc = "Choose buffer" })
map("n", "<leader>B", "<cmd>Buffers<CR>", { silent = true, desc = "FZF Buffers" })

-- NERDTree
-- Your old config used NERDTreeToggleVCS. If that command does not exist, use NERDTreeToggle.
map("n", "<C-g>", "<cmd>NERDTreeToggle<CR>", { desc = "Toggle NERDTree" })

-- Disable arrow keys
map({ "n", "v", "o" }, "<Up>", "<Nop>", { desc = "Disable Up" })
map({ "n", "v", "o" }, "<Down>", "<Nop>", { desc = "Disable Down" })
map({ "n", "v", "o" }, "<Left>", "<Nop>", { desc = "Disable Left" })
map({ "n", "v", "o" }, "<Right>", "<Nop>", { desc = "Disable Right" })

-- Go back to previous buffer
map("n", "gb", "M:b# <CR>", { desc = "Go to previous buffer" })

-- Search current word then jump tag
map("n", "<C-]>", "*<C-]>", { desc = "Search word and jump tag" })

-- Tagbar
map("n", "<F8>", "<cmd>TagbarToggle<CR>", { desc = "Toggle Tagbar" })

-- Better undo break points in insert mode
map("i", "<C-u>", "<C-g>u<C-u>", { desc = "Undo break before Ctrl-u" })
map("i", "<C-w>", "<C-g>u<C-w>", { desc = "Undo break before Ctrl-w" })

-- Terminal
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<leader>t", "<cmd>terminal<CR>", { desc = "Open terminal" })

-- Optional vim-ai mappings.
-- Only enable these if you actually install madox2/vim-ai.
-- map("n", "<leader>a", ":AI", { desc = "AI complete" })
-- map("x", "<leader>a", ":AI", { desc = "AI complete selection" })
-- map("c", "<leader>a", "AI", { desc = "AI command" })
-- map("x", "<leader>e", ":AIEdit", { desc = "AI edit selection" })
-- map("n", "<leader>e", ":AIEdit", { desc = "AI edit" })
-- map("c", "<leader>e", "AIEdit", { desc = "AIEdit command" })
-- map("x", "<leader>c", ":AIChat", { desc = "AI chat selection" })
-- map("n", "<leader>c", ":AIChat", { desc = "AI chat" })
-- map("c", "<leader>c", "AIChat", { desc = "AIChat command" })
-- map("n", "<leader>r", "<cmd>AIRedo<CR>", { desc = "AI redo" })

