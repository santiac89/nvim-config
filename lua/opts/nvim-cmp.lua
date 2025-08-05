local function _opts(_, opts)
  opts.sources = opts.sources or {}
  table.insert(opts.sources, {
    name = "lazydev",
    group_index = 0, -- set group index to 0 to skip loading LuaLS completions
  })
end

return _opts

