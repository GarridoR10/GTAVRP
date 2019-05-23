Config              = {}
Config.DrawDistance = 100.0
Config.MaxDelivery	= 10
Config.TruckPrice	= 200
Config.Locale       = 'en'

Config.Trucks = {
	"police",
	--"packer"	
}

Config.Cloakroom = {
	CloakRoom = {
			Pos   = {x = 429.71243286133, y = -1001.9100341797, z = 30.710290908813},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},
}

Config.Zones = {
	VehicleSpawner = {
			Pos   = {x = 433.67877197266, y = -1008.4196166992, z = 27.952291488647},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},

	VehicleSpawnPoint = {
			Pos   = {x = 432.00961303711, y = -1018.2215576172, z = 28.884462356567},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Type  = -1
		},
}

Config.Livraison = {
-------------------------------------------Los Santos
	-- Strawberry avenue et Davis avenue
	Delivery1LS = {
			Pos   = {x = 411.14566040039, y = -801.88555908203, z = 29.159580230713},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- a coté des flic
	Delivery2LS = {
			Pos   = {x = 360.1867980957, y = -595.01043701172, z = 28.643604278564},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- vers la plage
	Delivery3LS = {
			Pos   = {x = 231.35198974609, y = -795.62213134766, z = 30.579051971436},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 850
		},
	-- studio 1
	Delivery4LS = {
			Pos   = {x = 236.2025604248, y = -857.79278564453, z = 29.710599899292},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- popular street et el rancho boulevard
	Delivery5LS = {
			Pos   = {x = 182.68716430664, y = -1014.6352539063, z = 29.274997711182},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 850
		},
	--Alta street et las lagunas boulevard
	Delivery6LS = {
			Pos   = {x = 156.89189147949, y = -1033.8775634766, z = 29.232019424438},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 950
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery7LS = {
			Pos   = {x = 137.42570495605, y = -1071.6203613281, z = 29.187707901001},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery8LS = {
			Pos   = {x = 11.315257072449, y = -1123.26171875, z = 28.651592254639},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 950
		},
	--New empire way (airport)
	Delivery9LS = {
			Pos   = {x = 493.7414855957, y = -1024.5028076172, z = 28.134658813477},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	--Rockford drive south
	Delivery10LS = {
			Pos   = {x = -240.40580749512, y = -990.83068847656, z = 29.293298721313},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
------------------------------------------- Blaine County
	-- panorama drive
	Delivery1BC = {
			Pos   = {x = -663.52209472656, y = -951.78521728516, z = 21.282215118408},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- route 68
	Delivery2BC = {
			Pos   = {x = 224.44502258301, y = 203.64962768555, z = 105.52143096924},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Algonquin boulevard et cholla springs avenue
	Delivery3BC = {
			Pos   = {x = 11.58069229126, y = 548.25439453125, z = 175.98489379883},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- Joshua road
	Delivery4BC = {
			Pos   = {x = 639.62512207031, y = -1010.170715332, z = 36.622089385986},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- East joshua road
	Delivery5BC = {
			Pos   = {x = 345.6455078125, y = -1471.8735351563, z = 29.172874450684},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Seaview road
	Delivery6BC = {
			Pos   = {x = 140.37815856934, y = -1309.9241943359, z = 28.950939178467},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- Paleto boulevard
	Delivery7BC = {
			Pos   = {x = 87.93879699707, y = -1281.2340087891, z = 29.146589279175},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 950
		},
	-- Paleto boulevard et Procopio drive
	Delivery8BC = {
			Pos   = {x = 38.248271942139, y = -1096.421875, z = 29.323171615601},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- Marina drive et joshua road
	Delivery9BC = {
			Pos   = {x = -807.14764404297, y = -1097.6247558594, z = 10.598035812378},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Pyrite Avenue
	Delivery10BC = {
			Pos   = {x = 152.41914367676, y = -1034.7471923828, z = 29.333967208862},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	
	RetourCamion = {
			Pos   = {x = 421.98843383789, y = -1023.9783935547, z = 28.992238998413},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
	
	AnnulerMission = {
			Pos   = {x = 411.78363037109, y = -1020.2893676758, z = 29.355791091919},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
}
