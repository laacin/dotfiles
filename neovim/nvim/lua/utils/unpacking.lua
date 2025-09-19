local function unpacking(...)
  local result = {}

  local function fn(value)
    for _, p in pairs(value) do
      if type(p) == "string" then
        table.insert(result, p)
      else
        fn(p)
      end
    end
  end

  fn({ ... })

  return result
end

return unpacking
