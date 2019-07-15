"Notes on making our own vim syntax rules (e.g., for coloring lab notes)

"Key Phrases?
	syn match 	pythonComment 	"#.*$" display contains=pythonTodo,@Spell
	syn keyword pythonTodo		TODO FIXME XXX contained
	syn keyword pythonStatement
	syn match  	pythonDecorator
	syn keyword pythonException
	syn keyword pythonOperator	and in is not or
	syn keyword pythonImport	import
				

"Musings
"	Could hl certain units (or just units in general?), repetition nums, etc?
^why is vim softwrapping at 80 only? 
