local vehicles = {
{class = "compacts", name = "BLISTA", price = 2000},
{class = "compacts", name = "BLISTA2", price = 2000},
{class = "compacts", name = "BLISTA3", price = 2000},
{class = "compacts", name = "BRIOSO", price = 2000},
{class = "compacts", name = "DILETTAN", price = 2000},
{class = "compacts", name = "DILETTANTE2", price = 2000},
{class = "compacts", name = "ISSI2", price = 2000},
{class = "compacts", name = "PANTO", price = 2000},
{class = "compacts", name = "PRARIE", price = 2000},
{class = "compacts", name = "RHAPSODY", price = 2000},
{class = "offroad", name = "TROPHYTRUCK", price = 2800},
{class = "offroad", name = "TROPHYTRUCK2", price = 2800},
{class = "offroad", name = "BLAZER", price = 2800},
{class = "offroad", name = "BLAZER2", price = 2800},
{class = "offroad", name = "BLAZER3", price = 2800},
{class = "offroad", name = "BLAZER4", price = 2800},
{class = "offroad", name = "DUBSTA3", price = 2800},
{class = "offroad", name = "MONSTER", price = 2800},
{class = "offroad", name = "MARSHALL", price = 2800}, 
{class = "offroad", name = "INSURGENT", price = 2800},
{class = "offroad", name = "INSURGENT2", price = 2800},
{class = "offroad", name = "TECHNICAL", price = 2800},
{class = "offroad", name = "BFINJECT", price = 2800},
{class = "offroad", name = "BLAZER", price = 2800},
{class = "offroad", name = "BLAZER2", price = 2800},
{class = "offroad", name = "BLAZER3", price = 2800},
{class = "offroad", name = "BODHI2", price = 2800},
{class = "offroad", name = "DUNE", price = 2800},
{class = "offroad", name = "DUNE2", price = 2800},
{class = "offroad", name = "DLOADER", price = 2800},
{class = "offroad", name = "MESA3", price = 2800},
{class = "offroad", name = "RANCHERXL", price = 2800},
{class = "offroad", name = "RANCHERXL2", price = 2800},
{class = "offroad", name = "REBEL01", price = 2800},
{class = "offroad", name = "REBEL2", price = 2800},
{class = "offroad", name = "SANDKING", price = 2800},
{class = "offroad", name = "SANDKING2", price = 2800},
{class = "offroad", name = "BRAWLER", price = 2800},
{class = "test", name = "TORNADO2", price = 2222}
}

RegisterServerEvent("baseevents:enteredVehicle")
AddEventHandler("baseevents:enteredVehicle", function(veh, seat, displayName)
	local vehPrice = nil
	
	for k, veh in pairs(vehicles) do
		if displayName == veh.name then
			vehPrice = veh.price
			TriggerClientEvent("getVehPrice", -1, vehPrice)
		end
	end
	
	if seat == -1 and vehPrice ~= nil then
		print(GetPlayerName(source) .. " is driving a " .. displayName .. "!" .. " and the price is: " .. vehPrice)
	end
end)

RegisterServerEvent("sellVehicle")
AddEventHandler("sellVehicle", function(vehPrice)
	TriggerEvent("es:getPlayerFromId", source, function(user)
		user.addMoney(vehPrice)
		CancelEvent()
	end)
end)

RegisterServerEvent("resetMoney")
AddEventHandler("resetMoney", function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		user.setMoney(0)
	end)
end)


