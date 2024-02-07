local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local i = ls.insert_node
local newline = t({"",""})

local S = {
	s({ trig = "#", dscr = "shebang" },
		{
			t("#!/bin/bash")
		}
	),
}

return S
