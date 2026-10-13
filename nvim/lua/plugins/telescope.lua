return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<C-p>", "<cmd>Telescope find_files<cr>" },
			{ "<C-f>", "<cmd>Telescope live_grep<cr>" },
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "^.git/" },
				},
				pickers = {
					find_files = {
						-- respect .gitignore, but still surface gitignored .env* files
						find_command = {
							"sh",
							"-c",
							"{ rg --files --hidden -g '!.git/'; rg --files --hidden --no-ignore -g '.env*' -g '!node_modules/'; } | sort -u",
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
