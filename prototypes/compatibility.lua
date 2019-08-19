local function replace_ingredient(recipe_name, from, to, new_count)
  local r = data.raw.recipe[recipe_name]
  if not r then return end
  for _, ingredient in pairs(r.ingredients) do
    if ingredient[1] == from then
      ingredient[1] = to
      if new_count then
        ingredient[2] = new_count
      end
    end
  end
end

if data.raw.furnace["flare-stack"] then
  data.raw.recipe["flare-stack"].ingredients = {
    {"electronic-circuit", 1},
    {"mechanism-1", 1},
    {"pipe", 5},
    {"steel-plate", 2},
  }
  data.raw.recipe["vent-stack"].ingredients = {
    {"pipe", 5},
    {"steel-plate", 2},
  }
  table.insert(
    data.raw.technology["oil-processing"].effects,
    {type = "unlock-recipe", recipe = "flare-stack"})
  table.insert(
    data.raw.technology["oil-processing"].effects,
    {type = "unlock-recipe", recipe = "vent-stack"})
end

if data.raw["assembling-machine"]["sqs-furnace"] then
  table.insert(data.raw["assembling-machine"]["sqs-furnace"].crafting_categories, "kiln")
  table.insert(data.raw["assembling-machine"]["sqs-furnace"].crafting_categories, "basic-refining")
  table.insert(data.raw["assembling-machine"]["sqs-furnace"].crafting_categories, "refining")
end
