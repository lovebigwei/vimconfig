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
    init = function()
      vim.g.gruvbox_contrast_dark = "hard"
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  -- Nord theme
  {
    "nordtheme/vim",
    enabled = false,
  },
}
