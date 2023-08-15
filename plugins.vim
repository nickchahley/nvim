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

		Plug 'triglav/vim-visual-increment'
		Plug 'christoomey/vim-titlecase'
		" Plug 'reedes/vim-wheel'
		Plug 'tpope/vim-eunuch' 

		" Filetypes and Services
		Plug 'vim-scripts/autoit.vim--Breland'
		Plug 'gabrielelana/vim-markdown'
		Plug 'mrtazz/simplenote.vim'
		Plug 'mboughaba/i3config.vim'
		Plug 'tpope/vim-fugitive'

		" Python
		" Plug 'tmhedberg/SimpylFold'


		" Writing prose 
		Plug 'junegunn/goyo.vim'
		Plug 'junegunn/limelight.vim' 
		Plug 'dbmrq/vim-redacted'

	call plug#end()
" }}}
" {{{ Colorscheme and Theme
	" toggle italic support for certain colorschemes
	let g:dream_italic   = 1
	let g:dracula_italic = 1

	let g:monokai_term_italic = 0
	let g:monokai_gui_italic  = 1
	let g:materialmonokai_italic = 0
	" let g:airline_theme = 'minimalist'

	let g:sonokai_style = 'andromeda'
	let g:airline_theme = 'sonokai' 
" }}}
" {{{ vimwiki 

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
