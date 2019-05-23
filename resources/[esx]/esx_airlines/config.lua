Config              = {}
Config.DrawDistance = 100.0
Config.MaxDelivery	= 10
Config.TruckPrice	= 200
Config.Locale       = 'en'

Config.Trucks = {
	"Shamal",
	"Dodo",
	"Vestra",
	"Velum",
	"Nimbus",
	"Duster",
	"Volatus",
	"Swift",
	"Frogger",
	--"packer"	
}

Config.Cloakroom = {
	CloakRoom = {
			Pos   = {x = -979.56719970703, y = -2965.0046386719, z = 13.945071220398},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},
}

Config.Zones = {
	VehicleSpawner = {
			Pos   = {x = -992.20819091797, y = -2982.2634277344, z = 13.945072174072},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},

	VehicleSpawnPoint = {
			Pos   = {x = -1027.6086425781, y = -2981.6013183594, z = 13.944532394409},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Type  = -1
		},
}

Config.Livraison = {
-------------------------------------------Los Santos
	-- Strawberry avenue et Davis avenue
	Delivery1LS = {
			Pos   = {x = 62.550037384033, y = -752.63989257813, z = 339.68844604492},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- a coté des flic
	Delivery2LS = {
			Pos   = {x = 672.72821044922, y = 1068.3173828125, z = 414.25543212891},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- vers la plage
	Delivery3LS = {
			Pos   = {x = 1654.8811035156, y = 2470.4411621094, z = 103.42820739746},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- studio 1
	Delivery4LS = {
			Pos   = {x = 1392.20703125, y = 3166.7785644531, z = 41.484210968018},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- popular street et el rancho boulevard
	Delivery5LS = {
			Pos   = {x = 1918.3372802734, y = 3706.6918945313, z = 104.04981231689},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	--Alta street et las lagunas boulevard
	Delivery6LS = {
			Pos   = {x = 1986.7299804688, y = 4738.2099609375, z = 42.619895935059},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery7LS = {
			Pos   = {x = 2308.2797851563, y = 5515.5151367188, z = 125.86994934082},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery8LS = {
			Pos   = {x = 236.00355529785, y = 6515.2592773438, z = 74.571907043457},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 500
		},
	--New empire way (airport)
	Delivery9LS = {
			Pos   = {x = -1728.0233154297, y = 4799.7065429688, z = 120.28967285156},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	--Rockford drive south
	Delivery10LS = {
			Pos   = {x = -2317.7041015625, y = 3036.7976074219, z = 34.09912109375},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
------------------------------------------- Blaine County
	-- panorama drive
	Delivery1BC = {
			Pos   = {x = -3108.6037597656, y = 1232.1009521484, z = 72.430931091309},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- route 68
	Delivery2BC = {
			Pos   = {x = -2720.7163085938, y = -62.785503387451, z = 65.452056884766},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Algonquin boulevard et cholla springs avenue
	Delivery3BC = {
			Pos   = {x = -1853.6103515625, y = -1062.6385498047, z = 54.320533752441},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- Joshua road
	Delivery4BC = {
			Pos   = {x = -1502.6462402344, y = -2498.5366210938, z = 15.47105884552},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- East joshua road
	Delivery5BC = {
			Pos   = {x = -24.455080032349, y = -2671.8271484375, z = 134.83674621582},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Seaview road
	Delivery6BC = {
			Pos   = {x = 1681.2640380859, y = -2153.7155761719, z = 212.51051330566},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Paleto boulevard
	Delivery7BC = {
			Pos   = {x = 2507.3198242188, y = -1092.9736328125, z = 197.43617248535},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Paleto boulevard et Procopio drive
	Delivery8BC = {
			Pos   = {x = 2585.6730957031, y = 664.34222412109, z = 196.94358825684},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Marina drive et joshua road
	Delivery9BC = {
			Pos   = {x = 2611.36328125, y = 1925.5009765625, z = 189.4481048584},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Pyrite Avenue
	Delivery10BC = {
			Pos   = {x = 2710.2690429688, y = 2667.0563964844, z = 176.55467224121},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 110.0, y = 110.0, z = 10.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	
	RetourCamion = {
			Pos   = {x = -1041.8443603516, y = -2976.0786132813, z = 13.949381828308},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
	
	AnnulerMission = {
			Pos   = {x = -1036.0308837891, y = -2951.3359375, z = 13.950748443604},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
}
