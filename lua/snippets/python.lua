local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local i = ls.insert_node

local tab = function(n)
  n = n or 1
  local tabs = ""
  for j=1, n do tabs = tabs .. "\t" end
  return tabs
end

local newline = t({"",""})
local newtab = function(n) return t({"", tab(n)}) end

local S = {
  s({ trig = "scriptdir", regTrig = false, dscr = "scriptdir, dir of current file" },
    { t("Path(__file__).parent.resolve()")
    }
  ),
  s({ trig = "kwg", regTrig = false, dscr = "kwargs get stub" },
    { t("kwargs.get(\""), i(1), t("\", ")
    }
  ),
  s({ trig = "kwge", regTrig = false, dscr = "kwargs get insert" },
    { t("kwargs.get(\""), i(1), t("\", "), i(2), t(")")
    }
  ),
  s({ trig = "strnone", regTrig = false, dscr = "" },
    { t("str|None = None,")
    }
  ),
  s({ trig = "sp", regTrig = false, dscr = "" },
    { t("str|Path")
    }
  ),
  s({ trig = "pt", dscr = "process_time start" },
    {
      t("t = process_time()")
    }
  ),
  s({ trig = "ptt", dscr = "process_time end" },
    {
      t("print(f'process_time ["), i(0,""), t("]: {process_time() - t}')")
    }
  ),
  s({ trig = "imimp", dscr = "importlib" },
    { t("import importlib")
    }
  ),
  s({ trig = "mod", dscr = "importlib import module" },
    { i(0,''), t(" = importlib.import_module('"), i(1, ''), t(")")
    }
  ),
  s({ trig = "#", dscr = "shebang" },
    { t("#!/usr/bin/env python3")
    }
  ),
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
    {
      t({ 'def main(args):', '\tpass', '', ''}),
      t({ 'if __name__ == "__main__":', '\tmain(cline())', }),
    }
  ),
  s({ trig = "from", dscr = "import from" }, {
      t("from "), i(1), t(" import "), i(2)
    }
  ),
  -- imports and library specific
  s({ trig = "impol", dscr = "import polars" },
    { t({"import polars as pl", "import polars.selectors as cs"})
    }
  ),
  s({ trig = "p[l]*c", regTrig=true, dscr = "polars col" },
    { t("pl.col('"), i(0,''), t("')")
    }
  ),
  s({ trig = ".wc", regTrig=true, dscr = ".with_columns" },
    { t(".with_columns("), i(0, ''), t(")")
    }
  ),
  s({ trig = ".mkdir", regTrig=true, dscr = "Path mkdir" },
    { t(".mkdir(parents=True, exists_ok=True)")
    }
  ),
  s({ trig = "impan", dscr = "import pandas" },
    { t("import pandas as pd")
    }
  ),
  s({ trig = "pld", dscr = "polars dataframe" },
    { t("pl.DataFrame") }
  ),
  s({ trig = "plf", dscr = "polars lazyframe" },
    { t("pl.LazyFrame") }
  ),
  s({ trig = "plrs", dscr = "polars read csv" },
    { t("pl.read_csv("), i(1), t(")")}
  ),
  s({ trig = "pdd", dscr = "pandas dataframe" },
    { t("pd.DataFrame")
    }
  ),
  s({ trig = "impat[h]*", regTrig=true, dscr = "import pathlib Path" },
    { t({"from pathlib import Path"})
    }
  ),
  s({ trig = "imarg", dscr = "import argparse" },
    { t("import argparse, sys")
    }
  ),
  s({ trig = "arg", dscr = "add arg" }, {
      t("p.add_argument('"), i(1, "arg"), t("', help = '"), i(2, ""), t("')"),
    }
  ),
  s({ trig = "ast", dscr = "action store true" },
    { t("action='store_true'")
    }
  ),
  s({ trig = "asf", dscr = "action store false" },
    { t("action='store_false'")
    }
  ),
  s({ trig = "cline", dscr = "commandline fx bp" },
    {
      t({"import argparse, sys"}), newline,
      newline,
      t({"def cline(args_ls = sys.argv[1:]):", ""}),
      t({"\tp = argparse.ArgumentParser("}),
      t({"", "\t\tformatter_class = argparse.ArgumentDefaultsHelpFormatter,"}),
      t({"", "\t\tdescription = '"}), i(1), t("',"),
      t({"", "\t)"}),
      t({"", "\tp.add_argument('"}), i(1, "arg"), t("', help = '"), i(2, ""), t("')"),
      t({"", "\targs = p.parse_args(args_ls)"}),
      t({"", "\treturn args"}),
    }
  ),
  s({ trig = "cpucount", regTrig = false, dscr = "Cpu count w/ default" },
    {
      t("(int(os.cpu_count() or 1) - 1) if os.cpu_count() else 0"),
    }
  ),
  s({ trig = "rve", regTrig = false, dscr = "raise ValueError" },
    { t("raise ValueError(f\""), i(0), t("\")")
    }
  ),
  s({ trig = "cs", dscr = "commentstring" },
    { t('""" '), i(0, ""), t(' """')
    }
  ),
  s({ trig = "ret", regTrig = false, dscr = "docstring returns" },
    { t({"Returns", "-------", ""})
    }
  ),
  s({ trig = "args", regTrig = false, dscr = "docstring args" },
    { t({"Parameters", "----------", ""})
    }
  ),
  s({ trig = "ds", regTrig = false, dscr = "docstring template" },
    {
      t({'""" '}), i(1, ""), t({"","",""}),
      t({"Args", "----", ""}), i(2, ""), t({"",""}),
      t({"Returns", "-------", ""}), i(3, ""), t({"",""}),
      t({'"""'}),
    }
  ),
  s({ trig = "ad", regTrig = false, dscr = "AnnData" },
    { t("AnnData")
    }
  ),
  s({ trig = "imann", dscr = "import argparse" },
    { t("from anndata import AnnData")
    }
  ),
}

return S
