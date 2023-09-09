-- Started making it. Had a breakdown. Bon appetite.
vim.cmd.colorscheme('everforest')

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmode = {'longest', 'list', 'full'}
vim.opt.mouse = 'a'
vim.opt.scrolloff = 5

--  Spelling
--  To add a one-off spellfile use :setlocal spellfile+=.oneoff.utf-8.add
vim.cmd([[
	set spelllang=en
	set spellfile=$VIMHOME/spell/en.utf-8.add 
	hi SpellBad cterm=underline	
	nmap <leader>cs :setlocal spell!<CR>
]])
