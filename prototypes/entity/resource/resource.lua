local resource_autoplace = require("__base__.prototypes.entity.demo-resource-autoplace")
local xm = require("xmutil")

local function resource(resource_parameters, autoplace_parameters)
  if coverage == nil then coverage = 0.02 end

  return
  {
    type = "resource",
    name = resource_parameters.name,
    icon = "__xander-mod-th__/graphics/item/material/raw-resource/" .. resource_parameters.name .. ".png",
    icon_size = 32,
    flags = {"placeable-neutral"},
    order="a-b-"..resource_parameters.order,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_particle = resource_parameters.name .. "-particle",
      mining_time = resource_parameters.mining_time,
      result = resource_parameters.name
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = resource_parameters.name,
      order = resource_parameters.order,
      base_density = autoplace_parameters.base_density,
      has_starting_area_placement = true,
      resource_index = resource_autoplace.get_next_resource_index(),
      regular_rq_factor_multiplier = autoplace_parameters.regular_rq_factor_multiplier;
      starting_rq_factor_multiplier = autoplace_parameters.starting_rq_factor_multiplier;
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__xander-mod-th-graphics-1__/graphics/entity/resource/" .. resource_parameters.name .. ".png",
        priority = "extra-high",
        size = 64,
        frame_count = 8,
        variation_count = 8,
        hr_version =
        {
          filename = "__xander-mod-th-graphics-1__/graphics/entity/resource/" .. resource_parameters.name .. "-hr.png",
          priority = "extra-high",
          size = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5
        }
      }
    },
    map_color = resource_parameters.map_color
  }
end

local solid_resources = {
  -- [name]           = base_density, map_color
  ["coal"]            = {  8, {r=0.00, g=0.00, b=0.00} },
  ["copper-ore"]      = {  8, {r=0.35, g=0.48, b=0.54} },
  ["evaporites"]      = {  8, {r=0.90, g=0.90, b=0.90} },
  ["igneous-sulfide"] = {  8, {r=0.90, g=0.90, b=0.50} },
  ["iron-ore"]        = { 12, {r=0.52, g=0.24, b=0.20} },
  ["laterite"]        = {  8, {r=0.80, g=0.45, b=0.10} },
  ["magnetic"]        = {  8, {r=0.20, g=0.50, b=0.26} },
  ["massive-sulfide"] = {  8, {r=0.35, g=0.35, b=0.35} },
  ["phosphorite"]     = {  8, {r=0.07, g=0.35, b=0.33} },
  ["sand"]            = {  8, {r=0.70, g=0.42, b=0.47} },
  ["skarn"]           = {  8, {r=1.00, g=1.00, b=0.00} },
  ["stone"]           = {  4, {r=0.69, g=0.61, b=0.43} },
}

local function create_resource(name, params)
  local base_density = params[1]
  local map_color = params[2]

  data.raw.resource[name] = resource(
    {
      name = name,
      order = "b",
      map_color = map_color,
      mining_time = 1,
    },
    {
      base_density = base_density,
      regular_rq_factor_multiplier = 1,
      starting_rq_factor_multiplier = 1.2,
    }
  )
end

local function create_particle(name)
  data.raw.particle[name.."-particle"] = xm.clone("particle", "copper-ore-particle",
    {
      {
        "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-",
        "__xander-mod-th-graphics-1__/graphics/entity/resource/particle/" .. name .. "/" .. i .. ".png"
      },
      {
        "__base__/graphics/entity/copper-ore-particle/hr-copper-ore-particle-",
        "__xander-mod-th-graphics-1__/graphics/entity/resource/particle/" .. name .. "/hr-" .. i .. ".png"
      },
    }
  )
end

--Add new XM resources
for name, params in pairs(solid_resources) do
  create_resource(name, params)
  create_particle(name)
end

local natural_gas = xm.clone("resource", "crude-oil",
  {
    {
      "__base__/graphics/entity/crude-oil/crude-oil.png",
      "__xander-mod-th-graphics-1__/graphics/entity/resource/natural-gas.png",
    },
  },
  {
    name = "natural-gas",
    icon = "__xander-mod-th__/graphics/fluid/resource/natural-gas.png",
    map_color = {r=0.00,g=1.00,b=1.00},
  }
)
data:extend{natural_gas}
