local resource_autoplace = require("resource-autoplace")
local xm = require("xmutil")

--- resource_sheet creates a sprite sheet reference for a minable solid resource
-- @param sheet_index Factorio base sheet to use: 1=copper, 2=coal, 3=iron, 4=uranium, 5=stone
local function resource_sheet(sheet_index, tint)
  return {
    filename = "__xander-mod-th-graphics-1__/graphics/entity/ores/ore-1" .. sheet_index .. "-lr.png",
    priority = "extra-high",
    tint = tint,
    size = 64,
    frame_count = 8,
    variation_count = 8,
    hr_version = {
      filename = "__xander-mod-th-graphics-1__/graphics/entity/ores/ore-1" .. sheet_index .. "-hr.png",
      priority = "extra-high",
      tint = tint,
      size = 128,
      frame_count = 8,
      variation_count = 8,
      scale = 0.5,
    },
  }
end

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
      has_starting_area_placement = autoplace_parameters.has_starting_area_placement,
      regular_rq_factor_multiplier = autoplace_parameters.regular_rq_factor_multiplier;
      starting_rq_factor_multiplier = autoplace_parameters.starting_rq_factor_multiplier;
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet = resource_sheet(resource_parameters.sheet_index, resource_parameters.map_color)
    },
    map_color = resource_parameters.map_color
  }
end

local function create_resource(name, params)
  local base_density = params[1]
  local map_color = params[2]
  local is_starting = params[3]
  local sheet_index = params[4]

  resource_autoplace.initialize_patch_set(name, is_starting)
  data.raw.resource[name] = resource(
    {
      name = name,
      order = name,
      map_color = map_color,
      mining_time = 1,
      sheet_index = sheet_index,
    },
    {
      base_density = base_density,
      has_starting_area_placement = is_starting,
      regular_rq_factor_multiplier = 1,
      starting_rq_factor_multiplier = 1.2,
    }
  )
end

local function create_particle(name, tint)
  local function particle_picture(i, w, h)
    return {
      filename = "__xander-mod-th-graphics-1__/graphics/entity/ores-particle/ore-particle-" .. i .. ".png",
      priority = "extra-high",
      tint = tint,
      width = w,
      height = h,
      frame_count = 1
    }
  end

  local function particle_shadow(i, w, h)
    return {
      filename = "__xander-mod-th-graphics-1__/graphics/entity/ores-particle/ore-particle-shadow-" .. i .. ".png",
      priority = "extra-high",
      width = w,
      height = h,
      frame_count = 1
    }
  end

  local particle_name = name .. "-particle"
  local particle = {
    type = "particle",
    name = particle_name,
    flags = {"not-on-map"},
    life_time = 180,
    pictures = {
      particle_picture(1, 5, 5),
      particle_picture(2, 7, 5),
      particle_picture(3, 6, 7),
      particle_picture(4, 9, 8),
      particle_picture(5, 5, 5),
      particle_picture(6, 6, 4),
      particle_picture(7, 7, 8),
      particle_picture(8, 6, 5),
    },
    shadows = {
      particle_shadow(1, 5, 5),
      particle_shadow(2, 7, 5),
      particle_shadow(3, 6, 7),
      particle_shadow(4, 9, 8),
      particle_shadow(5, 5, 5),
      particle_shadow(6, 6, 4),
      particle_shadow(7, 7, 8),
      particle_shadow(8, 6, 5),
    },
  }
  data.raw.particle[particle_name] = particle
end

-- by sheet_index
local item_pictures = {
  "copper-ore",
  "coal",
  "iron-ore",
  "uranium-ore",
  "stone",
}
local function item(resource_parameters)
  local sheet = item_pictures[resource_parameters.sheet_index]
  local pictures = {}
  for i=1,4 do
    local filename = "__xander-mod-th__/graphics/item/material/raw-resource/mip/" .. sheet .. "-" .. i-1 .. ".png"
    if i == 1 then 
      filename = "__xander-mod-th__/graphics/item/material/raw-resource/mip/" .. sheet .. ".png"
    end
    pictures[i] = {
      size = 64,
      filename = filename,
      scale = 0.25,
      mipmap_count = 4,
      tint = resource_parameters.tint,
    }
  end
  return
  {
    type = "item",
    name = resource_parameters.name,
    icon = "__xander-mod-th__/graphics/item/material/raw-resource/" .. resource_parameters.name .. ".png",
    icon_size = 32,
    icon_mipmaps = 4,
    pictures = pictures,
    subgroup = "raw-resource",
    order = "b["..resource_parameters.name.."]",
    stack_size = 50,
  }
end

local function create_item(name, params)
  data.raw.item[name] = item{
    name = name,
    sheet_index = params[4],
    tint = params[2],
  }
end

local solid_resources = {
  -- [name]           = base_density, map_color, is_starting, sheet_index
  ["coal"]            = { 12, {r=0.00, g=0.00, b=0.00},  true, 2 },
  ["copper-ore"]      = {  8, {r=0.35, g=0.48, b=0.54},  true, 1 },
  ["evaporites"]      = {  4, {r=0.90, g=0.90, b=0.90},  true, 4 },
  ["igneous-sulfide"] = {  8, {r=0.90, g=0.90, b=0.50}, false, 3 },
  ["iron-ore"]        = { 12, {r=0.52, g=0.24, b=0.20},  true, 3 },
  ["laterite"]        = {  8, {r=0.80, g=0.45, b=0.10},  true, 5 },
  ["magnetic"]        = {  8, {r=0.20, g=0.50, b=0.26}, false, 1 },
  ["massive-sulfide"] = {  8, {r=0.35, g=0.35, b=0.35},  true, 3 },
  ["phosphorite"]     = {  8, {r=0.07, g=0.35, b=0.33}, false, 5 },
  ["sand"]            = {  8, {r=0.70, g=0.42, b=0.47},  true, 3 },
  ["skarn"]           = {  8, {r=1.00, g=1.00, b=0.00},  true, 4 },
  ["stone"]           = {  4, {r=0.69, g=0.61, b=0.43},  true, 5 },
}

-- preserve coal graphics
local coal_pictures = data.raw.item.coal.pictures

-- Add new XM resources
for name, params in pairs(solid_resources) do
  create_resource(name, params)
  create_particle(name)
  create_item(name, params)
end

-- fixup coal graphics
data.raw.resource.coal.stages.sheet.filename = "__base__/graphics/entity/coal/coal.png"
data.raw.resource.coal.stages.sheet.tint = nil
data.raw.resource.coal.stages.sheet.hr_version.filename = "__base__/graphics/entity/coal/hr-coal.png"
data.raw.resource.coal.stages.sheet.hr_version.tint = nil
data.raw.item.coal.pictures = coal_pictures

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
    autoplace = xm.NIL,
    minable = { results = { { name = "natural-gas" } } },
    map_color = {r=1.00,g=1.00,b=0.00},
  }
)
natural_gas.autoplace = resource_autoplace.resource_autoplace_settings{
  name = "natural-gas",
  order = "natural-gas",
  base_density = 8.1,
  base_sports_per_km2 = 1.8,
  random_probability = 1/48,
  random_spot_size_minimum = 1,
  random_spot_size_maximum = 1,
  additional_richness = 220000,
  has_starting_area_placement = false,
  regular_rq_factor_multiplier = 1,
}
data:extend{natural_gas}
