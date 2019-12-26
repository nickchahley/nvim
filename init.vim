" 	Started making it. Had a breakdown. Bon appetite.
" 	nikoli's vimrc started 2015
" {{{ Vim directory as a variable on unix/win
	if has('win32') || has('win64')
		" '.' is a join operator for let statements?
		" not necessarily the cannonical Windows vimdir location
		let $VIMHOME = $HOME.'/Neovim/nvim'
		let $VIMRC = $VIMHOME.'/init.vim'
		let $VIMSHARE = $HOME.'/Neovim/share/nvim'
		let $BACKUNDOSWAP = $HOME.'/Neovim/vim-backundoswap/'
		" Don't know what I'm doing here.
		set runtimepath+='$VIMSHARE/runtime'
	else 
		" This is nix
		let $VIMHOME = $HOME.'/.config/nvim'
		let $VIMSHARE = $HOME.'/.local/share/nvim'
		let $BACKUNDOSWAP = $HOME.'/.vim-backundoswap/'
	endif
" }}}
" {{{ Remap Leader before we use it for anything else
	let mapleader = "\<Space>"
	" Keep \ leader b/h b/c it still confuses me sometimes. Hopefully tmp
	nmap \ <Leader>
	vmap \ <Leader>
" }}}
source $VIMHOME/plugins.vim
" {{{ Terminal/GUI Specific
	" Unsure if this is correct sign for nvim gui on Windows. IIRC it is not on
	" linux
	if has("gui_running")
		set vb t_vb= "Disable error bell (gvim only)
		
		" Bars--  menubar, toolbar, scrollbar
		" '=' replace    '+=' add    '-=' rm
		set guioptions -=m " menubar 
		set guioptions -=T " toolbar 
		set guioptions -=r
		set guioptions -=L
		
		set guifont=Iosevka\ Term\ Medium:h11
		"set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10

	else 
		" This is console Vim.
		set noeb vb t_vb= " Disable error bell (vim only)
	endif
" }}}
" {{{ General Configuration

	" Added for vim-devicons
	set encoding=UTF-8

	" No idea what we're doing re: color support
	set background=dark
	set t_Co=256
	set termguicolors     " enable truecolor support, sometimes...
	colorscheme material-monokai-edit

	" Absolute line numbers in insert mode, else hybrid relative
	set relativenumber 
	augroup numbertoggle
	  autocmd!
	  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber nonumber
	  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber number
	augroup END

	set title             " Don't forget what you're editing
	set backspace=2       " backspace in i mode, even tho it's 'suboptimal'
	if &tabstop == 8      " Then probs on initial vimrc load, el don't overwrite
		set tabstop=4       " Tab width to 4
		set shiftwidth=4    " indent/outdent by 4
	endif                 " to stop our ts getting messed up when reloading vimrc
	set shiftround        " always indent/outdent to the nearest tabstop
	set smarttab          " use tabs at the start of a line, spaces elsewhere
	set foldmethod=marker " will be overwritten by modelines, ftplugins
	set autoread          " Update file on change. DTEW?
	set scrolloff=5       " Keep 5 lines above and below cursor

	" Open planes to right and bottom, feels more natural than default
	set splitbelow
	set splitright

	" Let me hide a buffer even if it is edited/unsaved
	set hidden

	" Handle tab-complete ambiguities like bash. 'wildmode' = 'wim'
	set wildmenu
	set wildmode=longest,list,full

	" Hilighting
	hi MatchParen gui=NONE cterm=NONE guibg=NONE  guifg=YELLOW ctermfg=YELLOW
	" {{{ Highlight current line and allow toggling
		" Function b/c xml files don't respect our color changes?
		function! ToggleCursorLine()
			hi CursorLineNr guifg=#FF5C57 guibg=NONE ctermbg=NONE
			hi CursorLine guibg=NONE ctermbg=NONE
			set cursorline! " toggle highlight current line
		endfunction
		nnoremap <Leader>C :call ToggleCursorLine()<CR>
		call ToggleCursorLine()
	" }}}
	" Cursor- blinking line in insert, underline for remove, bar otherwise
	set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
				\,a:blinkwait700-blinkoff400-blinkon250-CursorLineNr
				\,sm:block-blinkwait175-blinkoff150-blinkon175
	
	" Spelling
	" To add a one-off spellfile use :setlocal spellfile+=.oneoff.utf-8.add
	set spelllang=en
	set spellfile=$HOME/.vim/spell/en.utf-8.add " Default spellfile
	hi SpellBad cterm=underline	

	" Copy and paste. Holy shit.
	"set clipboard=unnamedplus " automatically use sys clipboard for c/p (linux)
	set clipboard+=unnamed    " automatically use sys clipboard for c/p (win)
	set pastetoggle=<F10>     " happier clipboard pasting, but turn off after

	" Search 
	set ignorecase         " Use case insensitive search
	set smartcase          " except when using capital letters
	set incsearch          " do incremental searching
	set hlsearch           " highlighting last used search pattern
	set inccommand=nosplit " Incremental hilight for replace
	" Clear search highlighting on screen redraw
	nnoremap <C-l> :nohls<CR><C-l> 
	
	set textwidth=79      " For autoformatting
	" Softwrap text, except comments. See :h fo-table
	set wrapmargin=8 " unsure why we have this set..
	set wrap
	set linebreak
	set breakindent  " preserve indent when wrapping lines
	set showbreak=..
	set nolist       " list disables linebreak
	set formatoptions=cqlj
	set formatoptions-=o

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
" {{{ Keybindings

	" Open a list of buffers, tab completion to switch. 
	" :sb split, :vert sb vsplit
	nnoremap <leader>b :ls<cr>:b<space>

	" Hopefully override global <C-j> mapping from vim-latex-suite
	nmap <Leader>j <Plug>IMAP_JumpForward
	nmap <Leader>j <Plug>IMAP_JumpForward

	" Execute current file 
	" should we have a second binding w/o <cr> so that we can run w/ options
	nnoremap <Leader>e :w<CR>:!%:p<CR>
	nnoremap <Leader>E :w<CR>:silent !%:p<CR><C-l>
	nnoremap <Leader>R :!%:p

	" Insert a timestamp, eg for naming meeting minutes
	nmap <F3> i<C-R>=strftime("%Y-%m-%d")<CR><Esc>
	imap <F3> <C-R>=strftime("%Y-%m-%d")<CR>

	" Do this LAST to override any mapping changes from plugins
	"source $VIMHOME/nikoli/date.vim
	source $VIMHOME/colemak.vim

	" switch to alternative buffer
	nnoremap <c-\> <c-^>

	" cd to that of current buffer
	nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" }}}
