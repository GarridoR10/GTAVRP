Config              = {}
Config.DrawDistance = 100.0
Config.MaxDelivery	= 10
Config.TruckPrice	= 200
Config.Locale       = 'en'

Config.Trucks = {
	"bus",
	--"packer"	
}

Config.Cloakroom = {
	CloakRoom = {
			Pos   = {x = -315.40328979492, y = -1014.7730712891, z = 30.380519866943},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},
}

Config.Zones = {
	VehicleSpawner = {
			Pos   = {x = -306.99020385742, y = -1004.2649536133, z = 30.385068893433},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},

	VehicleSpawnPoint = {
			Pos   = {x = -298.84771728516, y = -1005.1873168945, z = 30.383949279785},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Type  = -1
		},
}

Config.Livraison = {
-------------------------------------------Los Santos
	-- Strawberry avenue et Davis avenue
	Delivery1LS = {
			Pos   = {x = -275.13110351563, y = -1096.6845703125, z = 23.571155548096},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- a coté des flic
	Delivery2LS = {
			Pos   = {x = -285.64135742188, y = -1383.7574462891, z = 31.311941146851},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- vers la plage
	Delivery3LS = {
			Pos   = {x = -213.48713684082, y = -1150.0418701172, z = 22.947584152222},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 850
		},
	-- studio 1
	Delivery4LS = {
			Pos   = {x = 429.96142578125, y = -1136.0502929688, z = 29.317123413086},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- popular street et el rancho boulevard
	Delivery5LS = {
			Pos   = {x = 79.833053588867, y = -1088.5158691406, z = 29.326400756836},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 850
		},
	--Alta street et las lagunas boulevard
	Delivery6LS = {
			Pos   = {x = 142.02262878418, y = -933.34466552734, z = 29.878328323364},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 950
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery7LS = {
			Pos   = {x = 216.86099243164, y = -849.72760009766, z = 30.202920913696},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery8LS = {
			Pos   = {x = 243.2398223877, y = -943.25616455078, z = 29.177068710327},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 950
		},
	--New empire way (airport)
	Delivery9LS = {
			Pos   = {x = 178.28160095215, y = -1017.7706298828, z = 29.366243362427},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	--Rockford drive south
	Delivery10LS = {
			Pos   = {x = -458.5549621582, y = -828.09948730469, z = 30.480007171631},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
------------------------------------------- Blaine County
	-- panorama drive
	Delivery1BC = {
			Pos   = {x = -530.07403564453, y = -723.21990966797, z = 32.893615722656},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- route 68
	Delivery2BC = {
			Pos   = {x = -505.10214233398, y = -666.70458984375, z = 33.052433013916},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Algonquin boulevard et cholla springs avenue
	Delivery3BC = {
			Pos   = {x = -39.097225189209, y = -755.01373291016, z = 32.696140289307},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- Joshua road
	Delivery4BC = {
			Pos   = {x = 116.07466888428, y = -784.25872802734, z = 31.278820037842},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- East joshua road
	Delivery5BC = {
			Pos   = {x = 402.24740600586, y = -739.28057861328, z = 29.215167999268},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Seaview road
	Delivery6BC = {
			Pos   = {x = 396.59704589844, y = -991.94805908203, z = 29.386846542358},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- Paleto boulevard
	Delivery7BC = {
			Pos   = {x = 298.27352905273, y = -1807.2043457031, z = 27.236446380615},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 950
		},
	-- Paleto boulevard et Procopio drive
	Delivery8BC = {
			Pos   = {x = 115.66552734375, y = -1709.4053955078, z = 29.118614196777},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- Marina drive et joshua road
	Delivery9BC = {
			Pos   = {x = -42.548400878906, y = -1647.4318847656, z = 29.174703598022},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	-- Pyrite Avenue
	Delivery10BC = {
			Pos   = {x = -171.79483032227, y = -1465.8662109375, z = 31.865188598633},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 900
		},
	
	RetourCamion = {
			Pos   = {x = -346.20501708984, y = -1016.9215087891, z = 30.380525588989},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
	
	AnnulerMission = {
			Pos   = {x = -339.85595703125, y = -1003.2974853516, z = 30.384292602539},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
}
