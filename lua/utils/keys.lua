local M = {}

-- TODO: update to more convinient (keys, command, desc, opts, mode)
-- this will require finding all uses of lmap and changing third param 
-- from `{...}` to `opts = {...}` or maybe to `nil, {}`? Since I think in lua
-- named parameters are still positional?
-- See "named arguments", special syntax is fx{} instead of fx()
-- https://www.lua.org/pil/5.3.html
function M.leader_map (keys, command, opts, mode)
  mode = mode or 'n'
  opts = opts or {}
  return vim.keymap.set(mode, '<leader>'..keys, command, opts)
end

function M.map (keys, command, desc, opts, mode)
  mode = mode or 'n'
  desc = desc or nil
  opts = opts or {noremap = true, silent = true}
  opts['desc'] = desc
  return vim.keymap.set(mode, keys, command, opts)
end

function M.vmap(keys, command, desc, opts)
  return M.map(keys, command, desc, opts, 'v')
end
return M
