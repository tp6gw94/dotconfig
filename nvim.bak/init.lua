local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

if vim.g.vscode then
	local function bind_vscode_notify(mod, keymap, cmd)
		vim.keymap.set(mod, keymap, "call VSCodeNotify('" .. cmd .. "')")
	end
	require("options")
	require("keymap")
	require("lazy").setup({
		"asvetliakov/vim-easymotion",
	})
	bind_vscode_notify("n", "gp", "editor.action.showDefinitionPreviewHover")
else
	require("options")
	require("lazy").setup("plugins")
	require("keymap")
end
