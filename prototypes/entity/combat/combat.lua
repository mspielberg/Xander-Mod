local xmutil = require("xmutil")

--Base Overrides

--Base "stone-wall"
data.raw.wall["stone-wall"].max_health = 200
--Base "gate"
data.raw.gate["gate"].max_health = 200

--Base "gun-turret"
--Base "flamethrower-turret"

--Base "laser-turret"
data.raw["electric-turret"]["laser-turret"].rotation_speed = 0.005
data.raw["electric-turret"]["laser-turret"].energy_source =
{
	type = "electric",
	buffer_capacity = "1MJ",
	input_flow_limit = "12MW",
	drain = "30kW",
	usage_priority = "primary-input"
}

--Base "radar"
data.raw.radar["radar"].max_health = 200
data.raw.radar["radar"].max_distance_of_sector_revealed = 10
data.raw.radar["radar"].max_distance_of_nearby_sector_revealed = 2
data.raw.radar["radar"].energy_per_nearby_scan = "200kJ"

--Base "car"
--Base "tank"
data.raw.car["tank"].consumption = "500kW"
data.raw.car["tank"].turret_rotation_speed = 0.005


data:extend(
{

--Base "stone-wall" placeholder
--Brick Wall
xmutil.clone("wall", "stone-wall",
	{
		{
			"__base__/graphics/entity/stone-wall/wall-",
			"__xander-mod-th__/graphics/entity/combat/wall-2/",
		},
	},
	{
		name = "wall-2",
		icon = "__xander-mod-th__/graphics/item/combat/structure/wall-2.png",
		minable = {result = "wall-2"},
		max_health = 100,
	}
),
--Concrete Wall
xmutil.clone("wall", "stone-wall",
	{
		{
			"__base__/graphics/entity/stone-wall/wall-",
			"__xander-mod-th__/graphics/entity/combat/wall-3/",
		},
	},
	{
		name = "wall-3",
		icon = "__xander-mod-th__/graphics/item/combat/structure/wall-3.png",
		minable = {result = "wall-3"},
		max_health = 400,
	}
),
--Armored Basalt Wall
xmutil.clone("wall", "stone-wall",
	{
		{
			"__base__/graphics/entity/stone-wall/wall-",
			"__xander-mod-th__/graphics/entity/combat/wall-4/",
		},
	},
	{
		name = "wall-4",
		icon = "__xander-mod-th__/graphics/item/combat/structure/wall-4.png",
		minable = {result = "wall-4"},
		max_health = 600,
	}
),
--Impervious Wall
xmutil.clone("wall", "stone-wall",
	{
		{
			"__base__/graphics/entity/stone-wall/wall-",
			"__xander-mod-th__/graphics/entity/combat/wall-5/",
		},
	},
	{
		name = "wall-5",
		icon = "__xander-mod-th__/graphics/item/combat/structure/wall-5.png",
		minable = {result = "wall-5"},
		max_health = 1000,
	}
),
--Base "gate" placeholder
--Armored Gate
xmutil.clone("gate", "gate",
	{
		{
			"__base__/graphics/entity/gate/",
			"__xander-mod-th__/graphics/entity/combat/gate-2/",
		},
	},
	{
		name = "gate-2",
		icon = "__xander-mod-th__/graphics/item/combat/structure/gate-2.png",
		minable = {result = "gate-2"},
		max_health = 600,
		opening_speed = 0.08,
	}
),
--Impervious Gate
xmutil.clone("gate", "gate",
	{
		{
			"__base__/graphics/entity/gate/",
			"__xander-mod-th__/graphics/entity/combat/gate-3/",
		},
	},
	{
		name = "gate-3",
		icon = "__xander-mod-th__/graphics/item/combat/structure/gate-3.png",
		minable = {result = "gate-3"},
		max_health = 600,
		opening_speed = 0.08,
	}
),

--Base "gun-turret" placeholder
--Base "flamethrower-turret" placeholder

--Base "laser-turret" placeholder
--CO2 Laser Turret
xmutil.clone("electric-turret", "laser-turret",
	{
	},
	{
		name = "laser-turret-2",
		icon = "__xander-mod-th__/graphics/item/combat/structure/laser-turret-2.png",
		minable = {result = "laser-turret-2"},
		max_health = 2000,
		preparing_speed = 0.1,
		folding_speed = 0.1,
		energy_source = {
			buffer_capacity = "2MJ",
			input_flow_limit = "24MW",
			drain = "60kW",
		},
		folded_animation = { layers = { [1] = { tint = {r=0.9, g=1.1, b=0.9}, hr_version = { tint = {r=0.9, g=1.1, b=0.9} }}}},
		preparing_animation = { layers = { [1] = { tint = {r=0.9, g=1.1, b=0.9}, hr_version = { tint = {r=0.9, g=1.1, b=0.9} }}}},
		prepared_animation = { layers = { [1] = { tint = {r=0.9, g=1.1, b=0.9}, hr_version = { tint = {r=0.9, g=1.1, b=0.9} }}}},
		folding_animation = { layers = { [1] = { tint = {r=0.9, g=1.1, b=0.9}, hr_version = { tint = {r=0.9, g=1.1, b=0.9} }}}},
		base_picture = { layers = { [1] = { tint = {r=0.9, g=1.1, b=0.9}, hr_version = { tint = {r=0.9, g=1.1, b=0.9} }}}},
		attack_parameters = {
			range = 30,
			damage_modifier = 8,
			energy_consumption = "2MJ",
			action = {
				action_delivery = {
					max_length = 30,
				}
			}
		}
	}
),

--Nd:YAG Laser Turret
xmutil.clone("electric-turret", "laser-turret",
	{

	},
	{
		name = "laser-turret-3",
		icon = "__xander-mod-th__/graphics/item/combat/structure/laser-turret-3.png",
		minable = {result = "laser-turret-3"},
		max_health = 4000,
		rotation_speed = 0.02,
		preparing_speed = 0.2,
		folding_speed = 0.2,
		energy_source = {
			buffer_capacity = "3MJ",
			input_flow_limit = "48MW",
			drain = "120kW",
		},
		folded_animation = { layers = { [1] = { tint = {r=0.9, g=1.1, b=0.9}, hr_version = { tint = {r=0.9, g=1.1, b=0.9} }}}},
		preparing_animation = { layers = { [1] = { tint = {r=0.9, g=1.1, b=0.9}, hr_version = { tint = {r=0.9, g=1.1, b=0.9} }}}},
		prepared_animation = { layers = { [1] = { tint = {r=0.9, g=1.1, b=0.9}, hr_version = { tint = {r=0.9, g=1.1, b=0.9} }}}},
		folding_animation = { layers = { [1] = { tint = {r=0.9, g=1.1, b=0.9}, hr_version = { tint = {r=0.9, g=1.1, b=0.9} }}}},
		base_picture = { layers = { [1] = { tint = {r=0.9, g=1.1, b=0.9}, hr_version = { tint = {r=0.9, g=1.1, b=0.9} }}}},
		attack_parameters = {
			range = 40,
			damage_modifier = 16,
			energy_consumption = "10MJ",
			action = {
				action_delivery = {
					max_length = 40,
				}
			}
		}
	}
),

--Base "radar" placeholder
--Doppler Radar
xmutil.clone("radar", "radar",
{},
{
	name = "radar-2",
	icon = "__xander-mod-th__/graphics/item/combat/structure/radar-2.png",
	minable = {result = "radar-2"},
	max_health = 300,
	energy_per_sector = "20MJ",
	max_distance_of_sector_revealed = 31,
	max_distance_of_nearby_sector_revealed = 1,
	energy_per_nearby_scan = "200kJ",
	energy_usage = "500kW",
}
),
--LIDAR Scanning Array
xmutil.clone("radar", "radar",
{},
{
	name = "radar-3",
	icon = "__xander-mod-th__/graphics/item/combat/structure/radar-3.png",
	minable = {result = "radar-3"},
	max_health = 500,
	energy_per_sector = "10MJ",
	max_distance_of_sector_revealed = 8,
	max_distance_of_nearby_sector_revealed = 7,
	energy_per_nearby_scan = "1MJ",
	energy_usage = "1MW",
}
),

--Base "car" placeholder
--Base "tank" placeholder
--Artillery Crawler
xmutil.clone("car", "tank",
	{},
	{
		name = "artillery-crawler",
		icon = "__xander-mod-th__/graphics/item/combat/structure/artillery-crawler.png",
		minable = {result = "artillery-crawler"},
		braking_power = "500kW",
		consumption = "1MW",
		turret_rotation_speed = 0.005,
		guns = {"artillery-cannon", "tank-machine-gun", xmutil.NIL},
	}
),
--Tank Mark 2
xmutil.clone("car", "tank",
	{},
	{
		name = "tank-2",
		icon = "__xander-mod-th__/graphics/item/combat/structure/tank-2.png",
		minable = {result = "tank-2"},
		max_health = 6000,
		braking_power = "2MW",
		consumption = "2MW",
		terrain_friction_modifier = 0.1,
		turret_rotation_speed = 0.02,
		weight = 40000,
		inventory_size = 50,
		guns = {"tank-railgun", "tank-machine-gun", "tank-flamethrower"},
	}
),

}
)