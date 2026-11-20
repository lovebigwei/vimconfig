return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- The new plugin exports setup() directly from the top-level module
      local ts = require("nvim-treesitter")

      ts.setup({})

      -- Define the languages you want to automatically manage
      local languages = { "lua", "vim", "vimdoc", "bash", "c", "cpp", "python", "json", "yaml", "markdown" }
      local filetypes = { "lua", "vim", "help", "sh", "c", "cpp", "python", "json", "yaml", "markdown" }
      
      -- Installs your languages automatically
      ts.install(languages)

      -- Enable native Treesitter highlighting for these file types.
      vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
