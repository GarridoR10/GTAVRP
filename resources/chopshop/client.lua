local vehPrice = nil
local modPrice = vehPrice

Citizen.CreateThread(function()
	local blipX = 480.822265625
	local blipY = -1316.7186279297
	local blipZ = 29.202615737915
	local loadedBlip = false

	while true do
		Citizen.Wait(0)
		local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
		local distance = GetDistanceBetweenCoords(480.822265625,-1316.7186279297,29.202615737915, x, y, z, true)
	
		--load blip
		if not loadedBlip then 
			local blipSellCar = AddBlipForCoord(blipX, blipY, blipZ)
			SetBlipSprite(blipSellCar, 227)
			SetBlipDisplay(blipSellCar, 2)
			SetBlipScale(blipSellCar, 1.0)
			SetBlipColour(blipSellCar, 1)
			SetBlipAlpha(blipSellCar, 255)
			SetBlipAsShortRange(blipSellCar, true)
			BeginTextCommandSetBlipName("String")
			AddTextComponentString("Chop Shop")
			EndTextCommandSetBlipName(blipSellCar)
			loadedBlip = true
		end
		
		--load marker if player is in vehicle
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then			
			DrawMarker(1, 2505.325, 4214.261, 38.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 2.0, 255, 0, 0, 100, false, true, 1, false, false, false, false)
		end
		
		--vehicle health modifier
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) and vehPrice ~= nil then
			local health = GetEntityHealth(GetVehiclePedIsIn(GetPlayerPed(-1)))
			local modifier = health/1000
			modPrice = round((modifier * vehPrice), 0)
		end
		
		--ability to sell car if in range of chop shop
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) and distance <= 4.0 then
			drawText()
			if IsControlPressed(1, 38) then
				sellVehicle()
			end
		end
	end
end)

RegisterNetEvent("getVehPrice")
AddEventHandler("getVehPrice", function(price)
	vehPrice = price
end)

function drawText()
	SetTextFont(0)
	SetTextProportional(1)
	SetTextScale(0.0, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(2, 0, 0, 0, 255)
	SetTextDropshadow()
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("String")
	if vehPrice == nil then
		AddTextComponentString("The chop shop will not buy this vehicle!")
	else
		AddTextComponentString("Press key INPUT_PICKUP (default E) to sell your vehicle for $" .. modPrice .. "!")
	end
	DrawText( 0.5, 0.8 )

end

function sellVehicle()
	if vehPrice == nil then
		TriggerEvent("chatMessage", "^2You cannot sell this car!")
	else
		TriggerServerEvent("sellVehicle", modPrice)
		local vehicle = SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1)), true, true)
		DeleteVehicle(vehicle)
		vehPrice = nil
	end
end

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end



--development commands
RegisterCommand("currentveh", function(source, args, rawCommand)
	local currentVeh = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
	
	TriggerEvent("chatMessage", "In vehicle: " .. currentVeh .. " Worth: " .. vehPrice)
end)

RegisterCommand("resetmoney", function(source, args, rawCommand)
	TriggerServerEvent("resetMoney")
end)

RegisterCommand("health", function(source, args, rawCommand)
	local health = GetEntityHealth(GetVehiclePedIsIn(GetPlayerPed(-1)))
	modifier = health/1000
	modPrice = modifier * vehPrice
	
	TriggerEvent("chatMessage", "Health = " .. health .. " the price is: " .. modPrice)
end)