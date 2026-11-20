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

	-- Commenting with gc / gcc
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
			"Gedit",
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
		"andymass/vim-matchup",
		init = function()
			vim.g.matchup_delim_stopline = 15000
			vim.g.matchup_matchparen_stopline = 400
		end,
		config = function()
			require("match-up").setup({
				treesitter = {
					stopline = 500,
				},
			})
		end,
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

}
