---@diagnostic disable: undefined-field
vim.loader.enable() -- Speeds up Lua module loading

-- Disable unused built-in plugins for faster startup
local disabled_built_ins = {
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "matchit",
  "matchparen",
  "logiPat",
  "rrhelper",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "spellfile_plugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

-- These modules are not loaded by lazy
require("core.options")
require("core.mappings")

-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy with dynamic loading of anything in the plugins directory
require("lazy").setup("plugins", {
	change_detection = {
		enabled = true,
		notify = false,
	},
})

-- 🚀 Auto-sync plugins on first install
local lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"
if vim.fn.filereadable(lockfile) == 0 then
	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyDone",
		once = true,
		callback = function()
			require("lazy").sync()
		end,
	})
end
