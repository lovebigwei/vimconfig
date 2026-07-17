-- ~/.config/nvim/lua/plugins/legacy-vimrc.lua

return {
  -- NERDTree
  {
    "preservim/nerdtree",
    cmd = {
      "NERDTree",
      "NERDTreeToggle",
      "NERDTreeToggleVCS",
      "NERDTreeFind",
    },
  },

  -- Comments
  -- LazyVim already includes commenting support via mini.comment/snacks depending on version.
  -- Keep this only if you want exact vim-commentary behavior.
  {
    "tpope/vim-commentary",
    keys = {
      { "gc", mode = { "n", "v" } },
    },
  },

  -- Git
  {
    "tpope/vim-fugitive",
    cmd = {
      "Git",
      "G",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gwrite",
      "Gread",
      "Ggrep",
      "GMove",
      "GRename",
      "GDelete",
      "GBrowse",
    },
  },

  -- DoxygenToolkit
  {
    "vim-scripts/DoxygenToolkit.vim",
    cmd = {
      "Dox",
      "DoxAuthor",
      "DoxLic",
      "DoxBlock",
      "DoxUndoc",
    },
    init = function()
      vim.g.DoxygenToolkit_authorName = "BATW Hancao Tong"

      vim.g.DoxygenToolkit_licenseTag = table.concat({
        "",
        "CONFIDENTIAL - BATW COMPANY",
        "",
        "This is an unpublished work, which is a trade secret, created in",
        "2023. BATW Company owns all rights to this work and intends",
        "to maintain it in confidence to preserve its trade secret status.",
        "BATW Company reserves the right to protect this work as an",
        "unpublished copyrighted work in the event of an inadvertent or",
        "deliberate unauthorized publication.  BATW Company also",
        "reserves its rights under the copyright laws to protect this work",
        "as a published work.  Those having access to this work may not copy",
        "it, use it, or disclose the information contained in it without",
        "the written authorization of BATW Company.",
      }, "\n")

      vim.g.DoxygenToolkit_briefTag_pre = "@Synopsis  "
      vim.g.DoxygenToolkit_paramTag_pre = "@Param "
      vim.g.DoxygenToolkit_returnTag = "@Returns   "
      vim.g.DoxygenToolkit_templateParamTag_pre = "@Tparam "
      vim.g.DoxygenToolkit_classTag = "@Class "
      vim.g.DoxygenToolkit_briefTag_funcName = "yes"
    end,
  },

  -- fzf
  {
    "junegunn/fzf",
    build = "./install --bin",
  },

  {
    "junegunn/fzf.vim",
    dependencies = {
      "junegunn/fzf",
    },
    cmd = {
      "Files",
      "Buffers",
      "Rg",
      "Ag",
      "History",
      "GFiles",
    },
  },

  -- Tagbar
  {
    "preservim/tagbar",
    cmd = "TagbarToggle",
  },

  -- autopep8
  -- {
  --   "tell-k/vim-autopep8",
  --   ft = "python",
  -- },

  -- Surround
  -- LazyVim may already include mini.surround depending on your setup.
  {
    "tpope/vim-surround",
    keys = {
      { "ys", mode = "n" },
      { "cs", mode = "n" },
      { "ds", mode = "n" },
      { "S", mode = "v" },
    },
  },

  -- Gutentags
  {
    "ludovicchabant/vim-gutentags",
    init = function()
      vim.g.gutentags_project_root = { ".root", ".svn", ".git", ".project" }
      vim.g.gutentags_ctags_tagfile = ".tags"

      local tags_dir = vim.fn.expand("~/.cache/tags")
      vim.g.gutentags_cache_dir = tags_dir

      if vim.fn.isdirectory(tags_dir) == 0 then
        vim.fn.mkdir(tags_dir, "p")
      end

      vim.g.gutentags_ctags_extra_args = {
        "--fields=+niazS",
        "--extra=+q",
        "--c++-kinds=+pxI",
        "--c-kinds=+px",
      }

      vim.g.gutentags_file_list_command = "rg --files"
    end,
  },

  -- Peekaboo
  {
    "junegunn/vim-peekaboo",
    -- event = "VeryLazy",
    lazy = false,
  },

  -- Hardtime
  {
    "takac/vim-hardtime",
    init = function()
      vim.g.hardtime_default_on = 0
    end,
  },

  -- tmux navigator
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "Tmux left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<CR>", desc = "Tmux down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<CR>", desc = "Tmux up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<CR>", desc = "Tmux right" },
    },
  },

  -- Unimpaired
  {
    "tpope/vim-unimpaired",
    event = "VeryLazy",
  },

  -- Matchup
  {
      'andymass/vim-matchup',
      init = function()
        -- modify your configuration vars here
        vim.g.matchup_treesitter_stopline = 500

        -- or call the setup function provided as a helper. It defines the
        -- configuration vars for you
        require('match-up').setup({
          treesitter = {
            stopline = 500
          }
        })
      end,
      -- or use the `opts` mechanism built into `lazy.nvim`. It calls
      -- `require('match-up').setup` under the hood
      ---@type matchup.Config
      opts = {
        treesitter = {
          stopline = 500,
        }
      }
},

  -- GitHub Copilot
  {
    "github/copilot.vim",
    event = "InsertEnter",
    cmd = "Copilot",
    init = function()
      vim.g.copilot_enterprise_uri = "https://bmw.ghe.com"
    end,
  },

  -- vim-ai
  -- Your vimrc had config for vim-ai, but the plugin was commented.
  -- Enable this only if you use it.
  {
    "madox2/vim-ai",
    enabled = false,
    init = function()
      -- Do not store API keys directly here.
      -- Use environment variables instead.
      vim.g.vim_ai_chat = {
        provider = "openai",
        prompt = "",
        options = {
          endpoint_url = vim.env.VIM_AI_ENDPOINT_URL or "",
        },
      }

      vim.g.vim_ai_edit = {
        provider = "openai",
        prompt = "",
        options = {
          endpoint_url = vim.env.VIM_AI_ENDPOINT_URL or "",
        },
      }

      vim.g.vim_ai_complete = {
        provider = "openai",
        prompt = "",
        options = {
          endpoint_url = vim.env.VIM_AI_ENDPOINT_URL or "",
        },
      }
    end,
  },
}

