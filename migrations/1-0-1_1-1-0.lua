game.reload_script()

for index, force in pairs(game.forces) do
	force.reset_recipes()
	force.reset_technologies()

	local technologies = force.technologies
	local recipes = force.recipes

	if recipes["steel-charge-a"] and technologies["steel-processing"] then
		recipes["steel-charge-a"].enabled = technologies["steel-processing"].researched
	end

	if recipes["automation-science-pack"] and technologies["electricity"] then
		recipes["automation-science-pack"].enabled = technologies["electricity"].researched
	end

	if recipes["automation-science-pack"] and technologies["inserter-a"] then
		recipes["automation-science-pack"].enabled = technologies["inserter-a"].researched
	end
  
end
