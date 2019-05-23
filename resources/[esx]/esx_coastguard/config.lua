Config              = {}
Config.DrawDistance = 100.0
Config.MaxDelivery	= 10
Config.TruckPrice	= 200
Config.Locale       = 'en'

Config.Trucks = {
	"dinghy",
	"lguard",
	"valkyrie",
	"dinghy",
	"blazer2",
	--"packer"	
}

Config.Cloakroom = {
	CloakRoom = {
			Pos   = {x = -1203.6461181641, y = -1795.4396972656, z = 3.9026560783386},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},
}

Config.Zones = {
	VehicleSpawner = {
			Pos   = {x = -1256.4678955078, y = -1826.8620605469, z = 2.0859763622284},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},

	VehicleSpawnPoint = {
			Pos   = {x = -1276.1356201172, y = -1838.3726806641, z = 0.81662863492966},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Type  = -1
		},
}

Config.Livraison = {
-------------------------------------------Los Santos
	-- Strawberry avenue et Davis avenue
	Delivery1LS = {
			Pos   = {x = -1442.8508300781, y = -1651.3309326172, z = -0.47479292750359},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- a coté des flic
	Delivery2LS = {
			Pos   = {x = -1583.4854736328, y = -1439.2077636719, z = -0.1797997802496},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- vers la plage
	Delivery3LS = {
			Pos   = {x = -1723.8800048828, y = -1304.2879638672, z = -0.35212436318398},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 850
		},
	-- studio 1
	Delivery4LS = {
			Pos   = {x = -2109.99609375, y = -1064.3970947266, z = 0.26293694972992},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- popular street et el rancho boulevard
	Delivery5LS = {
			Pos   = {x = -2024.2219238281, y = -832.91424560547, z = 0.54105049371719},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 850
		},
	--Alta street et las lagunas boulevard
	Delivery6LS = {
			Pos   = {x = -2329.1455078125, y = -527.10015869141, z = 0.28521460294724},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 950
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery7LS = {
			Pos   = {x = -3164.361328125, y = 165.80969238281, z = -0.073829486966133},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery8LS = {
			Pos   = {x = -3422.7802734375, y = 909.47332763672, z = -0.045252174139023},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 950
		},
	--New empire way (airport)
	Delivery9LS = {
			Pos   = {x = -3299.7587890625, y = 1329.3603515625, z = -0.42231076955795},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	--Rockford drive south
	Delivery10LS = {
			Pos   = {x = -3095.1862792969, y = 1544.0804443359, z = 0.16881674528122},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
------------------------------------------- Blaine County
	-- panorama drive
	Delivery1BC = {
			Pos   = {x = -3164.48828125, y = 1921.4262695313, z = 0.30211699008942},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- route 68
	Delivery2BC = {
			Pos   = {x = -2833.5981445313, y = 2436.2670898438, z = 0.024725154042244},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Algonquin boulevard et cholla springs avenue
	Delivery3BC = {
			Pos   = {x = -2468.5678710938, y = 2581.7429199219, z = 0.34883669018745},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- Joshua road
	Delivery4BC = {
			Pos   = {x = -3184.1301269531, y = 3372.7143554688, z = -0.1540347635746},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- East joshua road
	Delivery5BC = {
			Pos   = {x = -1876.5402832031, y = 4655.36328125, z = -0.54243993759155},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Seaview road
	Delivery6BC = {
			Pos   = {x = -2100.1071777344, y = 5198.5654296875, z = 0.53263157606125},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- Paleto boulevard
	Delivery7BC = {
			Pos   = {x = -1623.8118896484, y = 5248.6791992188, z = -0.33846643567085},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 950
		},
	-- Paleto boulevard et Procopio drive
	Delivery8BC = {
			Pos   = {x = -971.63983154297, y = 6058.9716796875, z = -0.38565182685852},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- Marina drive et joshua road
	Delivery9BC = {
			Pos   = {x = -498.1828918457, y = 6490.8920898438, z = -0.77675449848175},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Pyrite Avenue
	Delivery10BC = {
			Pos   = {x = -3.6002871990204, y = 7231.9174804688, z = -0.49674597382545},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	
	RetourCamion = {
			Pos   = {x = -1288.4616699219, y = -1824.5557861328, z = 0.10141274333},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
	
	AnnulerMission = {
			Pos   = {x = -1298.7971191406, y = -1812.3023681641, z = -0.43839386105537},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
}
