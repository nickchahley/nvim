" Vim syntax file
" Custom syntax for drafting prose
" 28 Jan 2018

if exists("b:current_syntax")
	finish
endif

" Try to hilight generic latex functions. You should be writing letters nick..
	" match \word{} but do not hi parenth
	"syn match texFunction \"\\\(\(\a\|[.][._\a]\)[._\w]*\)\+\ *[{]\@="
	
	" match and hi any word preceeded by \
	syn match texFunction "\\\(\(\a\|[.][._\a]\)[._\w]*\)\+\ *"

	" But also other keywords
	"syn keyword texIf \if \fi \else containedin=texFunction

" Comments
syn match draftComment '%.*$' display contains=draftTodo
syn match draftCommentAlt '#.*$' display contains=draftTodo
syn keyword draftTodo TODO IDEA Idea MAYBE Maybe Alt FIXME contained


" Region baby's first
syn region draftRegion start='<' end='>' containedin=draftComment
syn region draftOptions start='\[' end=']' contains=texFunction
" TODO latex command, but don't know how to make end= matching close } not simply next }


" Highlight Syntax Elements
" opts: Todo, Comment, Statement, Type, PreProc, Constant
let b:current_syntax = 'draft'

hi def link draftComment  Comment
hi def link draftCommentAlt  Comment
hi def link draftTodo     Todo
hi def link draftRegion   PreProc
hi def link draftOptions  Constant
hi def link texFunction   Statement
"hi def link texIf         PreProc

" NOTES {{{

" On syn <cmd>
" 	match: match regexes instead of literal keywords

" On Contains
" 	contains=draftTodo,draftRegion <- contains groups draftTodo/Region
" 	contains=CONTAINED <- define anything that is 'contained' as valid in group
" 	contains=ALL
" 	contains=ALLBUT,<group>
" 	containedin=<group>

" }}}
