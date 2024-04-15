local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local i = ls.insert_node
local newline = t({"",""})

local S = {
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
		{
			t("#!/bin/bash")
		}
	),
}

return S
