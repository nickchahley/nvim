local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node

local S = {
	s({ trig = "sbash", regTrig = false, dscr = "bash shebang" },
		{ t({"#!/bin/bash", ""})
		}
	),
	-- DATETIMES
	s({ trig = "ymd", regTrig = false, dscr = "" },
		{ t(os.date("%Y-%m-%d"))
		}
	),
	s({ trig = "dby", regTrig = false, dscr = "" },
		{ t(os.date("%d %b %Y"))
		}
	),
	s({ trig = "adby", regTrig = false, dscr = "" },
		{ t(os.date("%a %d-%b-%Y"))
		}
	),
	s({ trig = "ts", regTrig = false, dscr = "timestamp" },
		{ t(os.date("%Hh%H"))
		}
	),
	s({ trig = "dts", regTrig = false, dscr = "datetimestamp" },
		{ t(os.date("%Y-%m-%d %Hh%H"))
		}
	),
}

return S
