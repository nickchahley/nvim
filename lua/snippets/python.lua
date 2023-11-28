local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local i = ls.insert_node

local S = {
	-- guts replacements
	s({ trig = "pwhoami", dscr = "decorate print that this output came from this fx" },
		{ t("print('\\n---- {sys._getframe().f_code.co_name} ----')")
		}
	),
	s({ trig = "whoami", dscr = "get name of current function" },
		{ t("sys._getframe().f_code.co_name")
		}
	),
	s({ trig = "pluc", dscr = "polars Unique Counts (columns)" },
		{i(0, "df"), t(".with_columns(pl.all().n_unique())[:1, :]")
		}
	),
	s({ trig = "pllc", dscr = "PoLars Lowercase Columns" },
		{ t(".rename( { x: x.lower() for x in "), i(1,"df"), t(".columns } )")
		}
	),
	-- aliases
	s({ trig = "p", dscr = "print" },
		{ t("print(f'"), i(1), t("')"),
		}
	),
	s({ trig = "l", dscr = "len (this saves like 2 keystrokes max..)" },
		{ t("len("), i(1), t(")"),
		}
	),
	-- patterns? motifs?
	s({ trig = "lc", dscr = "list comprehension" },
		{ t("[ "), i(1, "x"), t(" for "), i(2, "x"), t(" in "), i(3, "l"), t(" ]")
		}
	),
	s({ trig = "for i", dscr = "for range" },
		{ t("for i in range("), i(1), t("):")
		}
	),
	s({ trig = "for k", dscr = "dict items" },
		{ t("for "), i(1, "k"), t(", "), i(2, "v"), t(" in "), i(3, "d"), t(".items():")
		}
	),
	s({ trig = "def", dscr = "def fx" },
		{ t("def "), i(1), t("("), i(2, " "), t("):"),
			t({"", "\t",}), i(3), t({"", "\tpass"})
		}
	),
	s({trig = 'main', dscr = 'if name main'},
		{ t({ 'if __name__ == "__main__":', '\tmain()', }), }
	),
	s({ trig = "from", dscr = "import from" }, {
			t("from "), i(1), t(" import "), i(2)
		}
	),
	-- imports and library specific
	s({ trig = "impol", dscr = "import polars" },
		{ t("import polars as pl")
		}
	),
	s({ trig = "pld", dscr = "polars dataframe" },
		{ t("pl.DataFrame")
		}
	),
	s({ trig = "impat[h]*", regTrig=true, dscr = "import pathlib Path" },
		{ t({"from pathlib import Path", ""})
		}
	),
	s({ trig = "imarg", dscr = "import argparse" },
		{ t("import argparse")
		}
	),
	s({ trig = "arg", dscr = "add arg" }, {
			t("p.add_argument("), i(1, "arg"), t(", help='"), i(2, ""), t("')"),
		}
	),
	s({ trig = "parser.", dscr = "add arg" }, {
			t("parser.add_argument("), i(1, "arg"), t(", help='"), i(2, ""), t("')"),
		}
	),
	s({ trig = "cline", dscr = "commandline fx bp" }, {
			t({"def cline():", ""}),
			t({"\tp = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)", ""}),
			t("\tp.add_argument("), i(1, "arg"), t(", help='"), i(2, ""), t("')"),
			t({"","\treturn p.parse_args()"}),
		}
	),
}

return S
