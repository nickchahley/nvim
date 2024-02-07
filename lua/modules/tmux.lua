-- https://gist.github.com/nickchahley/de5de80fc75224c193ae2a3c8991c50d
local nmap = function(keys, navigation)
	vim.keymap.set('n', keys,
		":<C-U>TmuxNavigate"..navigation.."<CR>",
		{ silent = true, noremap = true })
end

local M = {
	{ 'christoomey/vim-tmux-navigator', lazy=false,
		init = function()
			-- Distinguish c-i and tab, no idea why this works
			-- https://neovim.discourse.group/t/problems-mapping-c-i-and-tab-separately/2926
			vim.keymap.set('n', '<C-I>', '<C-I>', {noremap=true})
			vim.keymap.set('n', '<Tab>', '<Cmd>bnext<CR>', {noremap=true})
			-- vim.keymap.set('n', '<Tab>', '<Tab>', {noremap=true})
			vim.g.tmux_navigator_no_mappings = 1
			nmap('<C-n>', 'Left')
			nmap('<C-e>', 'Down')
			nmap('<C-i>', 'Up')
			nmap('<C-o>', 'Right')
		end,
	},
  { 'vimpostor/vim-tpipeline', lazy=false }
}

return M
