local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node

local tab = function(n)
	n = n or 1
	local tabs = ""
	for j=1, n do tabs = tabs .. "\t" end
	return tabs
end

local newline = t({"",""})
local newtab = function(n) return t({"", tab(n)}) end


local S = {
	s({ trig = "s[( ]", regTrig=true, dscr = "lua snippet" },
		{
			t("s({ trig = \""), i(0, "trigger"), t({"\""}),
			t(", regTrig = "), i(1, "false"),
			t(", dscr = \""), i(2, ""), t("\" },"), newtab(1),
			t("{"), newtab(2),
			t("t(\""), i(3, ""), t("\")"), newtab(1),
			t({"}","),"}),
		}
	),
	s({ trig='sni[p]*[f]*[i]*[l]*[e]*', regTrig=true },
		{
			t({
				"local ls = require('luasnip')",
				"local s = ls.s",
				"local t = ls.text_node",
				"local i = ls.insert_node",
				'local newline = t({"",""})',
				"local S = {",
				"\ts('', {}),",
				"}",
				"return S",
			})
		}
	),
	s({ trig = "t", dscr = "text node" },
		{
			t("t({\""), i(0, ''), t("\"}),")
		}
	),
	s({ trig = "i", dscr = "insert node" },
		{
			t({"i("}), i(0, '0'), t({", '"}), i(1, ''), t({"'),"}),
		}
	),
	s({ trig = "regt", dscr = "regTrig" },
		{
			t("regTring=true, "), t({""})
		}
	),
	s("map",
		{
			t("vim.keymap.set('"),
			i(1, "n"), t("', '"),
			i(2, "keys"), t("', '"),
			i(3, "command"), t("')")
		}
	),
	s({trig="des[c]*", regTrig=true },
		{
			t("{ desc = '"), i(1, ""), t("' }")
		}
	),
	s({ trig = "{[ ]*", regTrig=true, dscr = "table par" },
		{
			t("{ "), i(0,''), t(" },")
		}
	),
}
return S
