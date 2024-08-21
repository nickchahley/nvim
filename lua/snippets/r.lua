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
local newtab = function(n) return t({"", tab(n)}) end
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
  s({ trig = "=T", dscr = "TRUE" },  { t("=TRUE ") }),
  s({ trig = "=F", dscr = "FALSE" }, { t("=FALSE ") }),
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
  s({ trig = "binr", dscr = "rscript shebang" },
    { t("#!/usr/bin/Rscript") }
  ),
  s({ trig = "name", dscr = "if name mane R" },
    {
      t({"if (sys.nframe() == 0) {"}),
      newtab(), t({"args = commandArgs(trailingOnly=TRUE)"}),
      newtab(), t({"if (length(args) == 0) {"}),
      newtab(2), t({"stop('Missing Arguments', call.=FALSE)"}),
      newtab(), t({"}"}),
      newtab(), t({"main(args)"}),
      t({"", "}"})
    }
  ),
  s({ trig = "setup", regTrig = false, dscr = "supress startup messages" },
    {
      t("setup <- function(){"), newline,
      t({"\t"}), i(0, ""), newline,
      t({"}"}), newline,
      newline,
      t({"if (sys.nframe() == 0) {"}), newline,
      t({"\tsuppressPackageStartupMessages(setup())"}), newline,
      t({"} else {setup()}"}), newline
    }
  ),
}
return S
