local M = {}

function M.leader_map (keys, command, opts, mode)
  mode = mode or 'n'
  opts = opts or {}
  return vim.keymap.set(mode, '<leader>'..keys, command, opts)
end

return M
