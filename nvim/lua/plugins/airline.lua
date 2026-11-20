return {
    {
        "vim-airline/vim-airline",
        lazy = false, -- load on startup so statusline is set
        dependencies = {
            "tpope/vim-fugitive",
        },
        config = function()
            vim.g["airline#extensions#branch#enabled"] = 1
            vim.g["airline#extensions#tabline#enabled"] = 1
            vim.g["airline#extensions#tabline#buffer_nr_show"] = 1
            vim.g.airline_theme = "base16_vim"
        end,
    },
    { "vim-airline/vim-airline-themes" },
}
