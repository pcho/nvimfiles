return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		update_focused_file = { enable = true },
		hijack_cursor = true,
		view = {
			cursorline = false,
			mappings = {
				list = {
					{ key = { "l", "h" }, action = "expand" },
					{ key = "s",          action = "split" },
					{ key = "v",          action = "vsplit" },
					{ key = "t",          action = "tabnew" },
					{ key = "r",          action = "refresh" },
					{ key = "c",          action = "create" },
					{ key = "D",          action = "remove" },
					{ key = "R",          action = "rename" },
				},
			},
		},
		actions = {
			open_file = {
				quit_on_open = true,
				resize_window = true,
			},
		},
	},
	tag = "nightly",
}
