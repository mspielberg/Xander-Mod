local util = require "util"

local function axe_tech(name, prerequisite)
  local unit = util.table.deepcopy(data.raw.technology[prerequisite].unit)
  return {
    type = "technology",
    name = name,
    icon_size = 32,
    icon = "__xander-mod-th__/graphics/item/production/tool/"..name..".png",
    effects =
    {
      {
        type = "character-mining-speed",
        modifier = 1
      }
    },
    prerequisites = {prerequisite},
    unit = unit,
  }
end

data:extend{
  axe_tech("alloy-steel-axe", "forging-alloy-a"),
  axe_tech("tungsten-carbide-axe", "tooling_2"),
  axe_tech("silicon-nitride-axe", "tooling_3"),
}
