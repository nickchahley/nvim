local M = {
	{
		'vimwiki/vimwiki', lazy=false,
		init = function()
			vim.env.SIMMUNOMEWIKI = vim.env.HOME .. '/projects/simmunome-wiki'
			vim.cmd([[nmap <Leader>w<Space> <Plug>VimwikiIndex]])
			vim.cmd([[let g:vimwiki_list = [
				\{
				\ 'path': '$SIMMUNOMEWIKI',
				\ 'ext': '.wiki',
				\ 'diary_rel_path': '',
				\ 'nested_syntaxes': {'python':'python', 'py':'python', 'r':'r', 'bash':'bash', 'go':'go', 'config':'config', 'i3':'i3config', 'sway':'i3config', 'md':'markdown', 'markdown':'markdown'},
				\ 'path_html': '$SIMMUNOMEWIKI/site_html/',
				\ 'auto_diary_index' : 1
				\ }] 
			]])
			vim.g.vimwiki_hl_headers = 1 -- " Color header levels	
			vim.g.vimwiki_hl_cb_checked = 2 -- " Hilighting for checked list items	
			vim.g.vimwiki_table_mappings = 0 -- " don't take over tab in insert mode 
			vim.g.vimwiki_folding = 'syntax'
			vim.cmd([[
				" Find incomplete tasks
				" Open a QuickFix window with incomplete tasks that are in a hyphenated list
				function! VimwikiFindIncompleteTasks()
					lvimgrep /- \[ \]/ %:p
					lopen
				endfunction

				function! VimwikiFindAllIncompleteTasks()
					VimwikiSearch /- \[ \]/
					lopen
				endfunction

				nmap <Leader>wa :call VimwikiFindAllIncompleteTasks()<CR>
				nmap <Leader>wx :call VimwikiFindIncompleteTasks()<CR>
			]])
			-- try to disable annoying things clobbering my maps
			vim.cmd([[
				vmap <F13> @<Plug>VimwikiTextObjListSingleV
				vmap <F13> @<Plug>VimwikiTextObjColumnInnerV
				vmap <F13> @<Plug>VimwikiTextObjTableCellInnerV
				vmap <F13> @<Plug>VimwikiTextObjHeaderSubContentV
				vmap <F13> @<Plug>VimwikiTextObjHeaderContentV
				vmap <F13> @<Plug>VimwikiTextObjHeaderV
				vmap <F13> @<Plug>VimwikiTextObjHeaderSubV
				vmap <F13> @<Plug>VimwikiTextObjTableCellV
				vmap <F13> @<Plug>VimwikiTextObjColumnV
				vmap <F13> @<Plug>VimwikiTextObjListChildrenV
				vmap <F13> <Plug>VimwikiTextObjListSingleV
				vmap <F13> <Plug>VimwikiTextObjColumnInnerV
				vmap <F13> <Plug>VimwikiTextObjTableCellInnerV
				vmap <F13> <Plug>VimwikiTextObjHeaderSubContentV
				vmap <F13> <Plug>VimwikiTextObjHeaderContentV
				vmap <F13> <Plug>VimwikiTextObjHeaderV
				vmap <F13> <Plug>VimwikiTextObjHeaderSubV
				vmap <F13> <Plug>VimwikiTextObjTableCellV
				vmap <F13> <Plug>VimwikiTextObjColumnV
				vmap <F13> <Plug>VimwikiTextObjListChildrenV
			]])
		end,
	},
}

return M
