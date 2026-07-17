-- ~/.config/nvim/lua/config/autocmds.lua

local autocmd = vim.api.nvim_create_autocmd

-- Source old vimrc after saving.
-- Not needed after full migration, so commented.
-- autocmd("BufWritePost", {
--   pattern = ".vimrc",
--   command = "source $MYVIMRC",
-- })

-- C/C++/Java comment style
autocmd("FileType", {
  pattern = { "java", "c", "cpp" },
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

-- Python autopep8 mapping.
-- Requires tell-k/vim-autopep8 plugin.
-- autocmd("FileType", {
--   pattern = "python",
--   callback = function()
--     vim.keymap.set("n", "<Leader>py", "<cmd>call Autopep8()<CR>", {
--       buffer = true,
--       desc = "Autopep8 format",
--     })
--   end,
-- })

-- Visual selection search using * and #
-- Kept as Vimscript because it is simple and reliable.

vim.cmd([[
xnoremap * :<C-u>call VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! VSetSearch(cmdtype) abort
    let temp = @s
    let temp_type = getregtype('s')
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype . '\'), '\n', '\\n', 'g')
    call setreg('s', temp, temp_type)
endfunction
]])

-- NERDTree window protection.
-- This is legacy behavior from your vimrc.
vim.cmd([[
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
      \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
]])

