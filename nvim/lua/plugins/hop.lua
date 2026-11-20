return {
	{
		"smoka7/hop.nvim",
		version = "v2",
		lazy = false,
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
		config = function(_, opts)
			-- Initialize hop with options defined in opts
			local hop = require("hop")
			hop.setup(opts)

			local directions = require("hop.hint").HintDirection

			-- Your custom traditional f/F/t/T mappings enhanced by Hop
			vim.keymap.set("", "f", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
			end, { remap = true })

			vim.keymap.set("", "F", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
			end, { remap = true })

			vim.keymap.set("", "t", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
			end, { remap = true })

			vim.keymap.set("", "T", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
			end, { remap = true })
		end,
		keys = {
			{
				"<leader>c",
				"<cmd>HopChar2MW<CR>",
				mode = { "n", "x", "o" },
				desc = "Hop 2 chars",
			},
			{
				"<leader>w",
				"<cmd>HopWordMW<CR>",
				mode = { "n", "x", "o" },
				desc = "Hop word",
			},
			{
				"<leader>l",
				"<cmd>HopLineStartMW<CR>",
				mode = { "n", "x", "o" },
				desc = "Hop line start",
			},
			{
				"<leader>p",
				"<cmd>HopPatternMW<CR>",
				mode = { "n", "x", "o" },
				desc = "Hop pattern",
			},
			{
				"<leader>a",
				"<cmd>HopAnywhereMW<CR>",
				mode = { "n", "x", "o" },
				desc = "Hop anywhere",
			},
			{
				"<leader>v",
				"<cmd>HopVerticalMW<CR>",
				mode = { "n", "x", "o" },
				desc = "Hop vertical",
			},
		},
	},
}
