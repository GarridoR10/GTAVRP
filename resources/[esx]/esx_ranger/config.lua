Config              = {}
Config.DrawDistance = 100.0
Config.MaxDelivery	= 10
Config.TruckPrice	= 200
Config.Locale       = 'en'

Config.Trucks = {
	"pranger",
	--"packer"	
}

Config.Cloakroom = {
	CloakRoom = {
			Pos   = {x = 824.86083984375, y = -1290.8800048828, z = 28.240659713745},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},
}

Config.Zones = {
	VehicleSpawner = {
			Pos   = {x = 834.05157470703, y = -1274.6279296875, z = 26.398731231689},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},

	VehicleSpawnPoint = {
			Pos   = {x = 831.29711914063, y = -1265.1271972656, z = 26.284269332886},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Type  = -1
		},
}

Config.Livraison = {
-------------------------------------------Los Santos
	-- Strawberry avenue et Davis avenue
	Delivery1LS = {
			Pos   = {x = 1551.25, y = 1330.4364013672, z = 94.538391113281},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- a coté des flic
	Delivery2LS = {
			Pos   = {x = 1414.4793701172, y = 2160.3479003906, z = 98.176109313965},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- vers la plage
	Delivery3LS = {
			Pos   = {x = 1845.6724853516, y = 2729.5844726563, z = 45.935012817383},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 850
		},
	-- studio 1
	Delivery4LS = {
			Pos   = {x = 1732.990234375, y = 3282.5847167969, z = 41.089206695557},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- popular street et el rancho boulevard
	Delivery5LS = {
			Pos   = {x = 2051.1337890625, y = 3561.5754394531, z = 40.70393371582},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 850
		},
	--Alta street et las lagunas boulevard
	Delivery6LS = {
			Pos   = {x = 2188.9008789063, y = 3887.4641113281, z = 31.845304489136},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 950
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery7LS = {
			Pos   = {x = 2465.5258789063, y = 3770.3781738281, z = 41.373218536377},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery8LS = {
			Pos   = {x = 2673.5419921875, y = 3929.3256835938, z = 42.920036315918},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 950
		},
	--New empire way (airport)
	Delivery9LS = {
			Pos   = {x = 2358.6540527344, y = 4841.171875, z = 40.938076019287},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	--Rockford drive south
	Delivery10LS = {
			Pos   = {x = 2208.9580078125, y = 5600.3149414063, z = 53.792198181152},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
------------------------------------------- Blaine County
	-- panorama drive
	Delivery1BC = {
			Pos   = {x = 1512.6987304688, y = 6335.828125, z = 24.044986724854},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- route 68
	Delivery2BC = {
			Pos   = {x = 450.94412231445, y = 6456.9633789063, z = 29.629360198975},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Algonquin boulevard et cholla springs avenue
	Delivery3BC = {
			Pos   = {x = -461.63107299805, y = 6462.8442382813, z = 2.8576259613037},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- Joshua road
	Delivery4BC = {
			Pos   = {x = -483.94302368164, y = 6064.6069335938, z = 29.429437637329},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- East joshua road
	Delivery5BC = {
			Pos   = {x = -582.34375, y = 5314.0473632813, z = 70.211128234863},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Seaview road
	Delivery6BC = {
			Pos   = {x = -812.34838867188, y = 5263.1962890625, z = 88.095687866211},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- Paleto boulevard
	Delivery7BC = {
			Pos   = {x = -485.73544311523, y = 4921.3803710938, z = 146.93385314941},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 950
		},
	-- Paleto boulevard et Procopio drive
	Delivery8BC = {
			Pos   = {x = -131.51138305664, y = 4614.8286132813, z = 125.10665130615},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- Marina drive et joshua road
	Delivery9BC = {
			Pos   = {x = 385.97161865234, y = 4406.33984375, z = 62.46594619751},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Pyrite Avenue
	Delivery10BC = {
			Pos   = {x = 714.58148193359, y = 4174.3676757813, z = 40.696582794189},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	
	RetourCamion = {
			Pos   = {x = 854.89373779297, y = -1280.3656005859, z = 26.503551483154},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
	
	AnnulerMission = {
			Pos   = {x = 838.42181396484, y = -1259.7993164063, z = 26.373369216919},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
}
