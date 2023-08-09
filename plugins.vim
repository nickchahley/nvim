" {{{ Linux and Windows specific hooks
if has('win32') || has('win64')
	let $WIKIHOME = $HOME.'/Dropbox/vimwiki'
	let g:python3_host_prog = $HOME.'/miniconda3/python.exe'
	let $SIMMUNOMEWIKI = 'D:/Simmunome/vimwiki'
else
	let $WIKIHOME = $HOME.'/vimwiki'
	let $SIMMUNOMEWIKI = '/mnt/d/Simmunome/vimwiki'
	" Automatically install vim-plug if DNE	
	if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
		silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
	endif
endif
" }}}

" {{{ Plugins to load/install
	call plug#begin('$VIMSHARE/plugged')

		" Utility
		" ctrlp seems way simpler to use than fzf preview. Works out of box
		" Plug 'vijaymarupudi/nvim-fzf'
		Plug 'ctrlpvim/ctrlp.vim'
		Plug 'triglav/vim-visual-increment'
		Plug 'tpope/vim-surround'
		Plug 'vim-scripts/BufOnly.vim'
		Plug 'vimwiki/vimwiki'
		Plug 'tpope/vim-eunuch' " Sugar for shell commands
		Plug 'wesQ3/vim-windowswap'
		Plug 'gioele/vim-autoswap'
		Plug 'godlygeek/tabular'
		Plug 'christoomey/vim-titlecase'
		Plug 'reedes/vim-wheel'

		" I want to try and implement a snippets plugin. Shortlist is ultisnips
		" and luasnip
		" pros of luasnip is that it might be a vector for me to learn lua syntax
		" Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} " Replace <CurrentMajor> by the latest released major (first number of latest release)

		" Plug 'SirVer/ultisnips'

		" Filetypes and Services
		Plug 'vim-scripts/autoit.vim--Breland'
		Plug 'gabrielelana/vim-markdown'
		Plug 'mrtazz/simplenote.vim'
		Plug 'mboughaba/i3config.vim'
		Plug 'nickchahley/vim-manpager'
		Plug 'tpope/vim-fugitive'

		" Python
		" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
		Plug 'nickchahley/pydoc.vim'
		Plug 'tmhedberg/SimpylFold'
		Plug 'vim-scripts/indentpython.vim'

		" Themes, Apperance, Colors
		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
		Plug 'ryanoasis/vim-devicons'
		Plug 'jacoborus/tender.vim'
		Plug 'skielbasa/vim-material-monokai'
		Plug 'sainnhe/everforest'
		Plug 'sainnhe/sonokai'
		Plug 'sainnhe/gruvbox-material'
		Plug 'sainnhe/edge'
		" Dracula and miasma req nvim > 8.0, but building from src results in
		" a slow editor for me (on wsl 230804)
		Plug 'Mofiqul/dracula.nvim'
		Plug 'xero/miasma.nvim', {'branch': 'dev'}
		Plug 'xero/sourcerer.vim'


		" Writing prose 
		Plug 'junegunn/goyo.vim'
		Plug 'junegunn/limelight.vim' 
		Plug 'dbmrq/vim-redacted'

	call plug#end()
" }}}
" {{{ ultisnips seems super powerful, but also a bit of a project to get
	" working.

	" Snippets are separated from the engine. Add this if you want them:
	" Plug 'honza/vim-snippets'

	" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
	" - https://github.com/Valloric/YouCompleteMe
	" - https://github.com/nvim-lua/completion-nvim
	let g:UltiSnipsExpandTrigger="<F9>"
	let g:UltiSnipsListSnippets="<c-F9>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"

	" If you want :UltiSnipsEdit to split your window.
	let g:UltiSnipsEditSplit="vertical"
" }}}
" {{{ Colorscheme and Theme
	" toggle italic support for certain colorschemes
	let g:dream_italic   = 1
	let g:dracula_italic = 1

	let g:monokai_term_italic = 0
	let g:monokai_gui_italic  = 1
	let g:materialmonokai_italic = 0
	" let g:airline_theme = 'minimalist'

	let g:everforest_background = 'soft'

	let g:sonokai_style = 'andromeda'
	let g:airline_theme = 'sonokai' 
" }}}
" {{{ Airline
	let g:airline#extensions#tabline#enabled    = 1
	let g:airline#extensions#whitespace#enabled = 0
	" show functin name + params
	let g:airline#extensions#tagbar#enabled = 1
	let g:airline#extensions#tagbar#flags = 's'
" }}}
" {{{ Semshi - python
	let g:semshi#error_sign_delay = 4
	let g:semshi#excluded_hi_groups = []
" }}}
" {{{ vimwiki 
	nmap <Leader>w<Space> <Plug>VimwikiIndex

	" Color header levels
	let g:vimwiki_hl_headers = 1

	" Hilighting for checked list items
	let g:vimwiki_hl_cb_checked = 2
	
	" Don't need vimwiki to take over tab in insert mode (clobbers snippets)
	let g:vimwiki_table_mappings = 0
	
	" Registered wikis, can open by list index w/ [1,2,etc]<Leader>w<Space>
	" What are templates and how do we use them
	let g:vimwiki_list = [
		\{
		\ 'path': '$SIMMUNOMEWIKI',
		\ 'ext': '.wiki',
		\ 'diary_rel_path': '',
		\ 'nested_syntaxes': {'python': 'python', 'r': 'r'},
		\ 'path_html': '$SIMMUNOMEWIKI/site_html/',
		\ 'auto_diary_index' : 1
		\ },{ 
		\ 'path': '$WIKIHOME',
		\ 'ext': '.wiki',
		\ 'path_html': '$WIKIHOME/site_html/',
		\ 'auto_diary_index' : 1
		\ },{ 
		\ 'path': '$WIKIHOME/wiki-DJG',
		\ 'ext': '.wiki',
		\ 'path_html': '$WIKIHOME/wiki-DJG/site_html/',
		\ 'auto_diary_index' : 1
		\ }]

	" retired wikis
	" {'path': '/home/nikoli/Clone/McGill/Courses/NEUR 630/Term Paper/wiki', 'syntax': 'markdown', 'ext': '.wiki'}
	" {'path': '/home/nikoli/OneDrive/McGill/Courses/BMDE 508/Grant Proposal/wiki', 'syntax': 'markdown', 'ext': '.wiki'}

	" Keymaps
	" Oh my god do shift mappings work in terminal now? No.
	:nmap <leader>s <Plug>VimwikiToggleListItem
	:nmap <C-J> <Plug>VimwikiSplitLink
	" reson for commenting: to restore visual block mode map
	" :nmap <C-V> <Plug>VimwikiVSplitLink

	" Foldmethod, list, expr (headers and sections), syntax
	let g:vimwiki_folding = 'syntax'

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

	
" }}}
" {{{ goyo
	let g:goyo_width = 85
	let g:goyo_height = 90
" }}}
" {{{ gabrielelana/vim-markdown
	let g:markdown_enable_spell_checking = 0
	let g:markdown_enable_conceal = 1
	let g:markdown_mapping_switch_status = '<space>s'
	let g:markdown_drop_empty_blockquotes = 0
" }}}
" {{{ vim-wheel
	let g:wheel#map#up='<C-u>'
	let g:wheel#map#down='<C-y>'
" }}}
" {{{ Simplenote 
	if filereadable("$VIMHOME/simplenoterc")
		source $VIMHOME/simplenoterc
	endif
	let g:SimplenoteFiletype = "markdown"
	" Single window mode
	let g:SimplenoteSingleWindow = 1
	" open :SimplenoteList either a vs or hs (def) split
	"let g:SimplenoteVertical = 0
	" set scratch buffer to X lines tall. Which ones is the scratch buffer?
	"let g:SimplenoteListHeight=10
" }}}
" {{{ vim-autoswap
	set title titlestring=
" }}}
" <c-p> is taken in vscode wsl. choose <c-t> to like fzf in shell
let g:ctrlp_map = '<c-t>'
" vim visual increment allow to increment letters as well
set nrformats=alpha
