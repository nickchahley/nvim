local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local i = ls.insert_node
local newline = t({"",""})
--[[ ideas todo:
autos
	can use for >> to %>% 
	=T/=F >> =TRUE/=FALSE (readability)
	"^[\w]+ = " >> "<x> <- "

setup function w/ if blash supresstartupmessages
my typical conflicted prefers
]]
local S = {
	s({ trig = "lib", dscr = "library" },
		{
			t("library("), i(1), t(")")
		}
	),
	s({ trig = "mkd[i]*[r]*[s]*", regTrig = true, dscr = "makedirs if dne" },
		{
			t("dir.create("), i(1, "dirname()"), t(", showWarnings=FALSE, recursive=TRUE)")
		}
	),
	s({ trig = "write.csv", dscr = "write.csv w/ defaults" },
		{
			t("write.csv("), i(1), t(", row.names=FALSE)")
		}
	),
	s({ trig = "=T", dscr = "TRUE" },
		{ t("=TRUE ") }
	),
	s({ trig = "=F", dscr = "FALSE" },
		{ t("=FALSE ") }
	),
	s({ trig = "binr", dscr = "rscript shebang" },
		{ t("#!/usr/bin/Rscript") }
	),
	s({ trig = "name", dscr = "if name mane R" },
		{
			t({"if (sys.nframe() == 0) {", "\t"}),
			i(1, ""),
			t({"", "}"})
		}
	),
	-- would like cleaner "this string or a partial match of this string",
	s({trig = "= f[u]*[n]*[c]*", regTrig = true},
		{
			t("<- function("), i(1, ""), t(") {"), newline,
			t("\t"), i(2, ""), newline,
			t("}")
	}),
	s({trig = "infu[n]*[c]*", regTrig = true, dscr = 'inline function'},
		{
			t("function("), i(1, ""), t(") {"), t("\t"), i(2, ""), t("}")
		}
	),
}
return S
