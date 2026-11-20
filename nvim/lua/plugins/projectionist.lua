return {
  {
    "tpope/vim-projectionist",
     config = function()
    vim.g.projectionist_heuristics = {
      ["*"] = {
        ["*.cpp"] = {
          alternate = { "{}.hpp", "{}.h" },
          type = "source",
        },
        ["*.h"] = {
          alternate = "{}.cpp",
          type = "header",
        },
        ["*.hpp"] = {
          alternate = "{}.cpp",
          type = "header",
        },
      },
    }
  end,
    lazy = false,
  },
}

