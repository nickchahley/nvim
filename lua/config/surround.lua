local surround = require("nvim-surround")

-- don't forget, else we get no defaultg config
surround.setup({})

-- surround.buffer_setup({
--   -- think by default these are trigger by 'S<key>'
--   surrounds = {
--     ["l"] = {
--       -- surround markdown link title, using clipboard contents
--       add = function()
--         local clipboard = vim.fn.getreg("+"):gsub("\n", "")
--         return {
--           { "[" },
--           { "](" .. clipboard .. ")" },
--         }
--       end,
--       find = "%b[]%b()",
--       delete = "^(%[)().-(%]%b())()$",
--       change = {
--         target = "^()()%b[]%((.-)()%)$",
--         replacement = function()
--           local clipboard = vim.fn.getreg("+"):gsub("\n", "")
--           return {
--             { "" },
--             { clipboard },
--           }
--         end,
--       },
--     },
--   },
-- })
