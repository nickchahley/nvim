local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node

local S = {
	s('trig', t('node') ),
	s({trig='vdw', dscr='vimwiki diary work'},
		{t({
			'[[inbox]]',
			'= Work =', '',
			'== TODO ==', '- [ ]',
			})
		}
	),
}
return S
