for _, f in pairs(game.forces) do
  if f.technologies["waste-venting"] and f.technologies["waste-venting"].researched then
    if f.recipes["calcium-chloride-venting"] then
      f.recipes["calcium-chloride-venting"].enabled = true
    end
  end
  if f.technologies["forging-iron"] and f.technologies["forging-iron"].researched then
    if f.recipes["pipe-iron-b"] then
      f.recipes["pipe-iron-b"].enabled = true
    end
  end
  if f.technologies["parts_1"] and f.technologies["parts_1"].researched then
    if f.recipes["mechanical-steam-engine-b"] then
      f.recipes["mechanical-steam-engine-b"].enabled = true
    end
  end
end
