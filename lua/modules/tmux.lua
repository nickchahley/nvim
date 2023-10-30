-- https://gist.github.com/nickchahley/de5de80fc75224c193ae2a3c8991c50d
local nmap = function(keys, navigation)
	vim.keymap.set('n', keys,
		":<C-U>TmuxNavigate"..navigation.."<CR>",
		{ silent = true, noremap = true })
end

local M = {
	{ 'christoomey/vim-tmux-navigator', lazy=false,
		init = function()
			vim.g.tmux_navigator_no_mappings = 1
			nmap('<C-n>', 'Left')
			nmap('<C-e>', 'Down')
			nmap('<C-i>', 'Up')
			nmap('<C-o>', 'Right')
		end,
	},
}

return M
