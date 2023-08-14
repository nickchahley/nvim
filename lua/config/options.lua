-- Started making it. Had a breakdown. Bon appetite.
local opt = vim.opt
local env = vim.env
local cmd = vim.cmd

opt.background = 'dark'
cmd.colorscheme('everforest')

opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.foldmethod = 'marker'
opt.number = true
opt.relativenumber = false
opt.title = true
opt.scrolloff = 5
opt.mouse = 'a'
opt.splitbelow = true
opt.splitright = true
opt.wildmode = {'longest', 'list', 'full'}
opt.backspace = {'indent', 'eol', 'start'}
opt.clipboard = 'unnamedplus' -- linux sys clipboard

-- Text formatting
opt.textwidth=79 
opt.wrap = true
opt.wrapmargin = 8 
opt.linebreak = true
opt.breakindent = true  -- preserve indent when wrapping lines
opt.showbreak = '..'
opt.list = false       -- "list disables linebreak" ? what?
opt.formatoptions = 'cqlj'

-- Search
opt.ignorecase = true         -- Use case insensitive search
opt.smartcase = true          -- except when using capital letters
opt.incsearch = true          -- do incremental searching
opt.hlsearch = true           -- highlighting last used search pattern
opt.inccommand = 'nosplit'    -- Incremental hilight for replace
cmd([[nnoremap <C-l> :nohls<CR><C-l>]]) -- Clear search highlighting on screen redraw

-- Spelling 
-- To add a one-off spellfile use :setlocal spellfile+=.oneoff.utf-8.add
opt.spelllang = 'en'
opt.spellfile = env.HOME .. '/spell/en.utf-8.add'
cmd([[hi SpellBad cterm=underline]])
cmd([[nmap <leader>cs :setlocal spell!<CR>]])
cmd([[syn match myExNonWords +\<\p*[^A-Za-z \t]\p*\>+ contains=@NoSpell]])

-- Cursor - blinking line in insert, underline for remove, bar otherwise
cmd([[
	set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		\,a:blinkwait700-blinkoff400-blinkon250-CursorLineNr
		\,sm:block-blinkwait175-blinkoff150-blinkon175
]])

-- {{{ Persistent Undo | Backup and Swap 
	-- Must make these dirs, vim will not create them!
	-- P.Undo: eg going 3 file saves earlier ':early 3f'
	-- use ':help clear-undo' to mark milestones/checkpoints
	opt.backup = true
	opt.backupdir = env.BACKUNDOSWAP .. '/backupfiles'
	opt.undofile = true -- maintain undo history b/t sessions
	opt.undodir = env.BACKUNDOSWAP .. '/undofiles'
	opt.dir = env.BACKUNDOSWAP .. '/swapfiles'
-- }}}


