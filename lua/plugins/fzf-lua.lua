-- fuzzy file finder with fzf-lua
return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("fzf-lua").setup({
				"default-title",
				winopts = {
					height = 0.40,
					width = 0.4,
					preview = {
						hidden = "hidden"
					}
				},
				files = {
					prompt = "   ",
					hidden = true,
					file_ignore_patterns = { "node_modules" },
				},
				grep = {
					prompt = "   ",
					rg_opts = "--column --line-number --no-heading --color=always --smart-case -L",
				},
				git = {
					branches = {
						prompt = "   ",
					}
				},
				helptags = {
					prompt = "   ",
				},
				keymap = {
					fzf = {
						["ctrl-j"] = "down",
						["ctrl-k"] = "up",
					}
				}
			})
		end,
	}
}