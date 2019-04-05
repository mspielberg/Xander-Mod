--New XM Items
--Group 6, subgroup 1
for i, entry in ipairs(xm_tool_items) do
	if entry[2] and not entry[1]:find("axe") then
		data:extend({xm_special_item(entry[1], nil, 6, 1, i - 1, entry[3], {entry[4], entry[5], entry[6]})})
	end
end


--Base Overrides

--Base "repair-pack"
data.raw["repair-tool"]["repair-pack"].icon = "__xander-mod-th__/graphics/item/production/tool/repair-pack-1.png"
data.raw["repair-tool"]["repair-pack"].order = "06-01-07"
data.raw["repair-tool"]["repair-pack"].speed = 0.5