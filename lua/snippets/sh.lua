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
local newtab = function(n)
  n = n or 1
  return t({"", tab(n)})
end
local nt = newtab

-- local newline = t({"",""})
-- newline broken? gives "effective child ext opts (a nil value)" use newtab(0)
-- instead

local S = {
  s({ trig = "scriptdir", regTrig = false, dscr = "full dirname of current script" },
    { t('SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )')
    }
  ),
  s({ trig = "useage", regTrig = false, dscr = "useage help" },
    {
      t('if [[ ($# == 0 ) || ( $@ == "--help" ) || ( $@ == "-h" ) ]]; then'),
      newtab(1), t('echo "Useage: $0 '), i(1, '<arg>'), t('"'),
      newtab(1), t('echo "'), i(2, '<description>'), t('"'),
      newtab(1), t('exit 1'),
      nt(0), t('fi'),
    }
  ),
  s({ trig = "#", dscr = "shebang" },
    { t("#!/usr/bin/env bash")
    }
  ),
  s({ trig = "all", regTrig = false, dscr = "all args macro" },
    { t('"$@"')
    }
  ),
  s({ trig = "allbut", regTrig = false, dscr = "all args except first macro" },
    { t('"${@:2}"')
    }
  ),
  s({ trig = "ifdir", regTrig = false, dscr = "if dir exists" },
    {
      t("if [[ -d \""), i(1,''), t({"\" ]]; then", ""}),
      t({"fi"}),
    }
  ),
  s({ trig = "ind", regTrig = false, dscr = "INSTALL_DIR" },
    { t("\"${INSTALL_DIR}\"")
    }
  ),
  s({ trig = "outf", regTrig = false, dscr = "OUTFILs" },
    { t("\"${OUTFILE}\"")
    }
  ),
  s({ trig = "arg", regTrig = false, dscr = "argument with defaults" },
    {
      i(1, "arg1"), t("=${"), i(3, "1"), t(":-"), i(2, "foo"), t("}")
    }
  ),
  -- good place to learn more advanced luasnips, like different snippet choices for OPTARG, show help, etc
  s({ trig = "getopts", regTrig = false, dscr = "getopts frame" },
    {
      t("# GETOPTS Reminders:"),
      nt(0), t("# Initalize the default values of optarg variables BEFORE"),
      nt(0), t("# Handle positional args AFTER"),
      nt(0), t("OPTIND=1"),
      nt(0), t("while getopts "), i(1, "x"), t(": opt; do"),
      newtab(1), t("case $opt in"),
        newtab(2), i(2, "x"), t(")"),
          newtab(3), i(3, "var"), i(4, "=$OPTARG"),
          newtab(3), t(";;"),
        newtab(2), t("*)"),
          newtab(3), t("echo 'unrecognized arg'"), newtab(3), t({"exit 1"}), newtab(3), t({";;"}),
      newtab(1), t("esac"),
      nt(0), t({"done"}),
      nt(0), t('shift "$((OPTIND-1))"'), nt(0)
    }
  ),
  s({ trig = "opts", regTrig = false, dscr = "Option parse: manual loop" },
    {
      t("# Parse Options:"),
      nt(0), t("#- You can shift multiple times inside a case statement to take multiple values"),
      nt(0), t("#- (unconfirmed) what does '*' do, when to shift at begining and end of case"),
      nt(0), t("while test $# -gt 0; do"),
      newtab(1), t({'case "$1" in'}),
      newtab(2), t("-h|--help)"),
      newtab(3), t('echo "$0 usage: "'),
      newtab(3), t('exit 0'), newtab(3), t(';;'),
      newtab(2), t('-'), i(1, 'x'), t(')'),
      newtab(3), t('shift'), newtab(3), t(';;'),
      newtab(2), t('*)'), nt(3), t('break'), nt(3), t(';;'),
      nt(1), t('esac'),
      nt(0), t('done')
    }
  ),
}

return S
