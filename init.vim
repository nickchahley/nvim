" 	Started making it. Had a breakdown. Bon appetite.`
" 	nikoli's vimrc started 2015
lua require('init.env')
lua require('init.lazy')
lua require('init.options')
" {{{ General Configuration

	" No idea what we're doing re: color support
	set background=dark
	set t_Co=256

	set relativenumber
	set nonumber
	set mouse=a
	set scrolloff=5
	set wildmode=longest,list,full
	set title              " Don't forget what you're editing
	set backspace=2        " backspace in i mode, even if it's suboptimal
	set tabstop=4          " Tab width to 4
	set shiftwidth=4       " indent/outdent by 4
	set shiftround         " always indent/outdent to the nearest tabstop
	set foldmethod=marker  " will be overwritten by modelines, ftplugins
	set textwidth=80       " For autoformatting
	set wrapmargin=8       " unsure why we have this set..
	set wrap
	set linebreak
	set breakindent        " preserve indent when wrapping lines
	set showbreak=..
	set nolist             " list disables linebreak
	set formatoptions=cqlj
	set formatoptions-=or

	" Buffers and splits
	set splitbelow
	set splitright

	" switch to alternative buffer
	nnoremap <c-\> <c-^>

	" cd to that of current buffer
	nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

	" Open a list of buffers, tab completion to switch. 
	" :sb split, :vert sb vsplit
	nnoremap <leader>b :ls<cr>:b<space>

	" open full width/height splits besides preexisting splits 
	nnoremap <leader>vr :botright vsplit<CR>
	nnoremap <leader>vl :topleft vsplit<CR>
	nnoremap <leader>hb :botright split<CR>
	nnoremap <leader>ha :topleft split<CR>

	" Search 
	set ignorecase         " Use case insensitive search
	set smartcase          " except when using capital letters
	set incsearch          " do incremental searching
	set hlsearch           " highlighting last used search pattern
	set inccommand=nosplit " 
	" Clear search highlighting on screen redraw
	nnoremap <C-l> :nohls<CR><C-l> 

	" Spelling
	set spelllang=en
	set spellfile=$VIMHOME/spell/en.utf-8.add 
	hi SpellBad cterm=underline	
	nmap <leader>cs :setlocal spell!<CR>
	syn match myExNonWords +\<\p*[^A-Za-z \t]\p*\>+ contains=@NoSpell

	" Hilighting
	" hi MatchParen gui=NONE cterm=NONE guibg=NONE  guifg=YELLOW ctermfg=YELLOW
	" Cursor- blinking line in insert, underline for remove, bar otherwise
	set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-CursorLineNr,sm:block-blinkwait175-blinkoff150-blinkon175
	
	" Copy and paste. Holy shit.
	set clipboard=unnamedplus " automatically use sys clipboard for c/p (linux)
	" set clipboard+=unnamed    " automatically use sys clipboard for c/p (win/wsl)
	set pastetoggle=<F10>     " happier clipboard pasting, but turn off after
	

" }}}
" {{{ Persistent Undo | Backup and Swap 
	" Must make these dirs, vim will not create them!
	" P.Undo: eg going 3 file saves earlier ':early 3f'
	" use ':help clear-undo' to mark milestones/checkpoints
	set backup
	set backupdir=$BACKUNDOSWAP/backupfiles
	set undofile " maintain undo history b/t sessions
	set undodir=$BACKUNDOSWAP/undofiles
	set dir=$BACKUNDOSWAP/swapfiles
" }}}
" {{{ Line Return
	" What does this do? Return to the previous line when reopening a file?
	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\ 	execute 'normal! g`"zvzz' |
			\ endif
	augroup END
" }}}
" {{{ Load local functions (bite sized plugins)
	let $FUNCTIONS = $VIMHOME.'/functions'
	source $FUNCTIONS/ToggleCursorline.vim
	nnoremap <Leader>C :call ToggleCursorLine()<CR>
	" call ToggleCursorLine()
	source $FUNCTIONS/ToggleStatusline.vim
" }}}
" {{{ Misc Keybindings

	" Execute current file 
	" should we have a second binding w/o <cr> so that we can run w/ options
	nnoremap <Leader>R :w<CR>!%:p<CR>
	" nnoremap <Leader>E :w<CR>:silent !%:p<CR><C-l>

	" Insert a timestamp, eg for naming meeting minutes
	nmap <F3> i<C-R>=strftime("%Y-%m-%d")<CR><Esc>
	imap <F3> <C-R>=strftime("%Y-%m-%d")<CR>

" }}}

" R insert pipe operator
autocmd FileType r inoremap <buffer> >> <Esc>:normal! a%>%<CR>a 
" autocmd FileType rnoweb inoremap <buffer> <C-M> <Esc>:normal! a%>%<CR>a 
" autocmd FileType rmd inoremap <buffer> <C-M> <Esc>:normal! a%>%<CR>a 
