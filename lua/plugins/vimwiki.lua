local M = {
	{
		'vimwiki/vimwiki',
		-- lazy = true,
		init = function()
			-- keys = { '<leader>w ', '<leader>wt'}
			vim.cmd([[nmap <Leader>w<Space> <Plug>VimwikiIndex]])
			vim.cmd([[let $SIMMUNOMEWIKI = '/mnt/d/Simmunome/vimwiki']])
			vim.cmd([[let g:vimwiki_list = [
				\{
				\ 'path': '$SIMMUNOMEWIKI',
				\ 'ext': '.wiki',
				\ 'diary_rel_path': '',
				\ 'nested_syntaxes': {'python': 'python', 'r': 'r'},
				\ 'path_html': '$SIMMUNOMEWIKI/site_html/',
				\ 'auto_diary_index' : 1
				\ }] 
			]])
		end,
	},
}

return M
