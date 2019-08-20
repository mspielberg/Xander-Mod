script.on_init(function()
  if not remote.interfaces.freeplay then return end
  local starting_items = remote.call("freeplay", "get_created_items")
  starting_items["mechanism-0"] = 20
  starting_items["copper-cable"] = 100
  starting_items["electric-engine-unit"] = 10
  remote.call("freeplay", "set_created_items", starting_items)
end)
