local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local i = ls.insert_node
local S = {
	s('main', {
		t({
			'def main():',
			'\treturn None',
			'',
			'if __name__ == "__main__":',
			'\tmain()',
		}),
	})
}
return S
