local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local i = ls.insert_node
local newline = t({"",""})

local S = {
  s({ trig = "scriptdir", regTrig = false, dscr = "full dirname of current script" },
    { t('SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )')
    }
  ),
  s({ trig = "usage", regTrig = false, dscr = "usage help" },
    {
      t('if [[ ($# == 0 ) || ( $@ == "--help" ) || ( $@ == "-h" ) ]]; then'), newline,
      t('\techo "Useage: $0 '), i(1, '<arg>'), t('"'), newline,
      t('\techo "'), i(2, '<description>'), t('"'), newline,
      t('\texit 1'), newline,
      t({'fi'}), newline
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
}

return S
