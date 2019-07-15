" Description {{{
"   vim: set foldmethod=marker:
"   Original by Shai Coleman, 2008-04-21.  http://colemak.com/
"   Modified by Joel Esko, 2012-09-14. github.com/jooize/vim-colemak
"	  Modified by Nick Chahley, 2016+
"
"   Load colemak.vim after all other Vim scripts.
"   Unmappable: <C-s>, <C-q> (intercepted before reaching editor)
" }}}
" Require Vim >=7.0 {{{
	if v:version < 700 | echohl WarningMsg | echo "colemak.vim: You need Vim version 7.0 or later." | echohl None | finish | endif
" }}}
" Up/down/left/right {{{
	nnoremap n h|xnoremap n h|onoremap n h|
	nnoremap o l|xnoremap o l|onoremap o l|
	" Always go down/up one line regardless of "set wrap". Is that a sane default?
	nnoremap e gj|xnoremap e gj|onoremap e gj|
	nnoremap i gk|xnoremap i gk|onoremap i gk|
	" Default vim mvmt b/h
	"nnoremap e j|xnoremap e j|onoremap e j|
	"nnoremap i k|xnoremap i k|onoremap i k|
	" Turbo Navigation
	" Works with counts, see ":help complex-repeat"
	nnoremap <silent> N @='5h'<CR>|xnoremap <silent> N @='5h'<CR>|onoremap <silent> N @='5h'<CR>|
	" Always go down/up 5 line regardless of "set wrap". Is that a sane default?
	nnoremap <silent> E @='5gj'<CR>|xnoremap <silent> E @='5gj'<CR>|onoremap <silent> E @='5gj'<CR>|
	nnoremap <silent> I @='5gk'<CR>|xnoremap <silent> I @='5gk'<CR>|onoremap <silent> I @='5gk'<CR>|
	"nnoremap <silent> E @='5j'<CR>|xnoremap <silent> E @='5j'<CR>|onoremap <silent> E @='5j'<CR>|
	"nnoremap <silent> I @='5k'<CR>|xnoremap <silent> I @='5k'<CR>|onoremap <silent> I @='5k'<CR>|
	nnoremap <silent> O @='5l'<CR>|xnoremap <silent> O @='5l'<CR>|onoremap <silent> O @='5l'<CR>|
" }}}
" Scrolling --- Buffer Gross Cursor movements we never use {{{
	" Scroll [n] lines u/d <C-(u/d)>
	nnoremap <C-u> <C-y>
	nnoremap <C-y> <C-e>
	" mv screen up/down half page
	nnoremap <C-f> <C-u>
	nnoremap <C-p> <C-d>
	" PgUp/PgDn >> just use PgUp/PgDn! can liberate C-p and C-f too
	" TODO can change this latter if finding a better use for C-p/g
	nnoremap <C-p> <C-b>
	nnoremap <C-g> <C-f>
	" jt/jb mv current line to top/bottom of screen
	nnoremap jj zz|
" }}}
" Cursor to start/end of line {{{
	" ^ = mv to first non-blank char of line; 0 = mv to start of line
  " start of line text
	nnoremap B ^
	vnoremap B ^
	onoremap B ^
  " end of line  
	" undecided on where we want this exactly
	nnoremap b $
	vnoremap b $
	onoremap b $
	" don't map f for now so we can still us 'go to prev occurance of'
	"nnoremap f $
	"vnoremap f $
	"onoremap f $
" }}}
" Indexed Line Jumping {{{
	" 123<CR> will now jump to  line 123, instead of jumping down 123 lines
	" '' = return to prev loc in file (for when you accidently hit <CR>)
	nnoremap <CR> G
	" Get numeric keypad working for line jumping
	nmap <kEnter> <Enter> 
" }}}
" Jump List :h jumps {{{
	" Mv u/d (h/d) jump list [c] times; [c]<C-h>; :jumps = view list
	nnoremap <C-h> <C-o>
	nnoremap <C-d> <C-i>
" }}}
" Words forward/backward {{{
	" l/L = back word/WORD
	" u/U = forward end of word/WORD
	" y/Y = forward word/WORD
	nnoremap l b|xnoremap l b|onoremap l b|
	nnoremap L B|xnoremap L B|onoremap L B|
	nnoremap u e|xnoremap u e|onoremap u e|
	nnoremap U E|xnoremap U E|onoremap U E|
	nnoremap y w|xnoremap y w|onoremap y w|
	nnoremap Y W|xnoremap Y W|onoremap Y W|
	cnoremap <C-l> <C-Left> 
	cnoremap <C-y> <C-Right>
" }}}
" inSert/Replace/append (T) {{{
	nnoremap s i|
	nnoremap S I|
	nnoremap t a|
	nnoremap T A|
	" gi should be gs for us since we use 's' for insert
	" Goes to the last insertion point and gets in insert mode
	nnoremap gs gi
" }}}
" Change {{{
	nnoremap w c|xnoremap w c|
	nnoremap W C|xnoremap W C|
	nnoremap ww cc|
" }}}
" Cut/copy/paste {{{
	" Note: "0 reg is always your last YANK command (c C cc), so c and x don't
	" have the same relationship as copy and cut.
	" TODO consider mapping a 'yank and delete' command so we can del text into
	" the special "0 register (although for a similar amount of thought could
	" just delete into a specific register like "k?)
	nnoremap x x|xnoremap x d|
	nnoremap c y|xnoremap c y|
	nnoremap v p|xnoremap v p|
	nnoremap X d$|xnoremap X d|
	nnoremap C y$|xnoremap C y|
	nnoremap V P|xnoremap V P|
	nnoremap cc yy|
	" Like "v/V" but leave cursor just after/before new text
	nnoremap jv gp|
	nnoremap jV gP|
	" Open newline, then put. Opt: prefix w/ reg ["+,(v/V)] (above/below) 
	nnoremap <expr> ,v 'o<ESC>"'.v:register.v:count1.'p'
" }}}
" Undo/redo {{{
	nnoremap z u|xnoremap z :<C-u>undo<CR>|
	nnoremap gz U|xnoremap gz :<C-u>undo<CR>|
	nnoremap Z <C-R>|xnoremap Z :<C-u>redo<CR>|
" }}}
" Visual mode {{{
	nnoremap a v|xnoremap a v|
	nnoremap A V|xnoremap A V|
	" reselect last visual selection
	nnoremap ga gv
	nnoremap <C-a> <C-v>|xnoremap <C-a> <C-a>
	" Make insert/add work also in visual line mode like in visual block mode
	xnoremap <silent> <expr> s (mode() =~# "[V]" ? "\<C-v>0o$I" : "I")
	xnoremap <silent> <expr> S (mode() =~# "[V]" ? "\<C-v>0o$I" : "I")
	xnoremap <silent> <expr> t (mode() =~# "[V]" ? "\<C-v>0o$A" : "A")
	xnoremap <silent> <expr> T (mode() =~# "[V]" ? "\<C-v>0o$A" : "A")
" }}}
" Search {{{
	" Next/prev search match
	" I.e., Repeat latest / or ? [count] times fwd/bkw (n/N)
	nnoremap k n|xnoremap k n|onoremap k n|
	nnoremap K N|xnoremap K N|onoremap K N|
	
	" To/Till_before (f/t) [count]'th occurrence of char p/P :
	" exclusive/inclusive
	" This works for most commands with motions: e.g., dp" will delete up to
	" excluding the next occurance of '"', 2dP" will delete up to including the
	" 2nd next '"'
	nnoremap p t|xnoremap p t|onoremap p t|
	nnoremap P T|xnoremap P T|onoremap P T|
" }}}
" inneR text objects {{{
	" e.g. dip (delete inner paragraph) is now drp
	onoremap r i
" }}}
" Folds {{{
	" Honestly j to z might be a place where we can recursive map
	nnoremap j z|xnoremap j z|
	" mv down to start of next fold, closed inclusive, [count]
	nnoremap jn zj|xnoremap jn zj|
	" mv up to end of prev fold, closed inclusive, [count]
	nnoremap je zk|xnoremap je zk|
" }}}
" Overridden keys must be prefixed with g {{{
	nnoremap gX X|xnoremap gX X|
	nnoremap gK K|xnoremap gK K|
	nnoremap gL L|xnoremap gL L|
	nnoremap gv gp|xnoremap gv gp|
	nnoremap gV gP|xnoremap gV gP|
" }}}
" Window and Split handling {{{
	nnoremap <C-w>n <C-w>h|xnoremap <C-w>n <C-w>h|
	nnoremap <C-w>e <C-w>j|xnoremap <C-w>e <C-w>j|
	nnoremap <C-w>i <C-w>k|xnoremap <C-w>i <C-w>k|
	nnoremap <C-w>o <C-w>l|xnoremap <C-w>o <C-w>l|
	" alt for slightly less finger mvmt
	nnoremap <C-x>n <C-w>h|xnoremap <C-x>n <C-w>h|
	nnoremap <C-x>e <C-w>j|xnoremap <C-x>e <C-w>j|
	nnoremap <C-x>i <C-w>k|xnoremap <C-x>i <C-w>k|
	nnoremap <C-x>o <C-w>l|xnoremap <C-x>o <C-w>l|
	" Note: this is a nightmare. Let's just 
	" Let terminal send its keycodes to vim 
	" to get keycode enter a literal char in insert mode with {C-v}{key/combo}
	" BUT keycode for <esc> is ^[ , so having either of these as remaps results
	" in unacceptable lag before registering <esc> to exit a mode
	":set <M-n>=n
	":set <M-e>=e
	":set <M-i>=i
	":set <M-o>=o
	"" Easier split navigation 
	"nnoremap <M-n> <C-w><C-h>
	"nnoremap <M-e> <C-w><C-j>
	"nnoremap <M-i> <C-w><C-k>
	"nnoremap <M-o> <C-w><C-l>
" }}}
" Open (insert on newline) command fix for ; --> o {{{
	nnoremap h o
	nnoremap H O
" }}}

