return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    enabled = false,
    lazy = false,
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
  -- Gruvbox
  {
    "morhetz/gruvbox",
    enabled = true,
    lazy = false,
    init = function()
      vim.g.gruvbox_contrast_dark = "hard"
    end,
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  -- Nord theme
  {
    "nordtheme/vim",
    enabled = false,
  },
}
