vim.cmd([[
	" Open a list of buffers, tab completion to switch. 
	" :sb split, :vert sb vsplit
	nnoremap <leader>b :ls<cr>:b<space>

	" switch to alternative buffer
	nnoremap <c-\> <c-^>


	" Execute current file 
	" should we have a second binding w/o <cr> so that we can run w/ options
	nnoremap <Leader>e :w<CR>:!%:p<CR>
	nnoremap <Leader>E :w<CR>:silent !%:p<CR><C-l>
	nnoremap <Leader>R :!%:p

	" Insert a timestamp, eg for naming meeting minutes
	imap <F3> <C-R>=strftime("%Y-%m-%d, %H:%M")<CR>
	imap <F4> <C-R>=strftime("%Mh%H, %d-%m-%Y")<CR>

	" cd to that of current buffer
	nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

	" open full width/height splits besides preexisting splits 
	nnoremap <leader>vr :botright vsplit<CR>
	nnoremap <leader>vl :topleft vsplit<CR>
	nnoremap <leader>hb :botright split<CR>
	nnoremap <leader>ha :topleft split<CR>
]])

vim.cmd([[source $VIMHOME/colemak.vim]])
