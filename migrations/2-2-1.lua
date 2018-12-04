for _, f in pairs(game.forces) do
  if f.technologies["waste-venting"] and f.technologies["waste-venting"].researched then
    if f.recipes["calcium-chloride-venting"] then
      f.recipes["calcium-chloride-venting"].enabled = true
    end
  end
end
