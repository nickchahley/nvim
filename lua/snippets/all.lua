-- Generating variants from a base snippet
-- basic date, I am new here
-- https://cj.rs/blog/generating-snippets-with-luasnip/
-- use "function nodes" to call the date cmd on the fly, when the snipped gets
-- expanded. 
-- Bullet Journal styled dates in the future
local function gen_date_snippets()
  local snippets = {}
  local target_dates = {
    "today",
    "tomorrow",
    "next monday",
    "next tuesday",
    "next wednesday",
    "next thursday",
    "next friday",
    "next week",
    "next month",
  }
  for _, target_date in pairs(target_dates) do
    table.insert(
      snippets,
      s("bj_" .. target_date:gsub(" ", "_"), {
        t "# ",
        f(function(args, snip, user_arg_1)
          return vim.fn.trim(vim.fn.system([[date -d ']] .. target_date .. [[' +'%F %a']]))
        end, {}),
      })
    )
  end

  return snippets
end

return gen_date_snippets()
