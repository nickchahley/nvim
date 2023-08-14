lua require('config.env')
lua require('config.lazy')
lua require('config.options')
lua require('config.keybinds')
source $VIMHOME/colemak.vim

" Vim directory as a variable on unix/win
" if has('win32') || has('win64')
" 	" '.' is a join operator for let statements?
" 	" not necessarily the cannonical Windows vimdir location
" 	let $VIMHOME = $HOME.'/Neovim/nvim'
" 	let $VIMRC = $VIMHOME.'/init.vim'
" 	let $VIMSHARE = $HOME.'/Neovim/share/nvim'
" 	let $BACKUNDOSWAP = $HOME.'/Neovim/vim-backundoswap/'
" 	" Don't know what I'm doing here.
" 	set runtimepath+='$VIMSHARE/runtime'
" endif

" Terminal/GUI Specific
" " Unsure if this is correct sign for nvim gui on Windows. IIRC it is not on
" " linux
" if has("gui_running")
" 	set vb t_vb= "Disable error bell (gvim only)
	
" 	" Bars--  menubar, toolbar, scrollbar
" 	" '=' replace    '+=' add    '-=' rm
" 	set guioptions -=m " menubar 
" 	set guioptions -=T " toolbar 
" 	set guioptions -=r
" 	set guioptions -=L
	
" 	" font selection seem to be handled fine in ginit.vim for now
" 	" set guifont=Iosevka\ Term\ Medium:h11
" 	" set guifont=Source\ Code\ Pro\ Regular:h11

" else 
" 	" This is console Vim.
" 	set noeb vb t_vb= " Disable error bell (vim only)
" endif

