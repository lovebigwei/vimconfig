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
      
      -- Installs your languages automatically
      ts.install(languages)

      -- Enable highlighting and indentation native features via autocommand
      vim.api.nvim_create_autocmd("FileType", {
        pattern = languages,
        callback = function()
          -- Turn on native Neovim treesitter highlighting
          vim.treesitter.start()
          
          -- Turn on treesitter-based smart indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}

