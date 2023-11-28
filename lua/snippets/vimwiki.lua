local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local i = ls.insert_node
local newline = t({"",""})
local S = {
	-- unicode alias
	s("\\d", t("Δ")),
	s(",d", t("Δ")),
	-- codeblocks
	s("cb",{
		t("{{{"), i(1, ""),
		newline, i(2, "<verbose/code>"), t({ "", "}}}"}),
	}),
	s({trig="[b]*[a]*sh", regTrig=true},{
		t({"{{{bash", ""}), i(1, ""), t({ "", "}}}"}),
	}),
	s({trig="fis[h]*", regTrig=true},{
		t({"{{{fish", ""}), i(1, ""), t({ "", "}}}"}),
	}),
	s("py",{
		t({"{{{py", ""}), i(1, ""), t({ "", "}}}"}),
	}),
	s("r",{
		t({"{{{r", ""}), i(1, ""), t({ "", "}}}"}),
	}),
	-- templates
	s({trig='vdw', dscr='vimwiki diary work'},
		{t({
			'[[inbox]]', '',
			'= Work =', '',
			'== Brief ==', '',
			'== TODO ==', '- [ ]',
			})
		}
	),
}
return S
