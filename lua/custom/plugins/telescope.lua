return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			pickers = {
				find_files = {
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--ignore",
						"-u",
						"--glob=!**/.git/*",
						"--glob=!**/node_modules/*",
						"--glob=!**/.next/*",
					},
				},
			},
		},
		config = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>d", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>b", builtin.buffers, {})
			vim.keymap.set("n", "<c-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
		config = function()
			pcall(require("telescope").load_extension, "fzf")
		end,
	},
}
