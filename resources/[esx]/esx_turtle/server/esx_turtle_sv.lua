ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingTurtle     = {}
local PlayersTransformingTurtle   = {}
local PlayersSellingTurtle        = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(5000, CountCops)

end

CountCops()

--turtle
local function HarvestTurtle(source)

	if CopsConnected < Config.RequiredCopsTurtle then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsTurtle)
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingTurtle[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local turtle = xPlayer.getInventoryItem('turtle')

			if turtle.limit ~= -1 and turtle.count >= turtle.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_turtle'))
			else
				xPlayer.addInventoryItem('turtle', 1)
				HarvestTurtle(source)
			end

		end
	end)
end

RegisterServerEvent('esx_turtle:startHarvestTurtle')
AddEventHandler('esx_turtle:startHarvestTurtle', function()

	local _source = source

	PlayersHarvestingTurtle[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestTurtle(_source)

end)

RegisterServerEvent('esx_turtle:stopHarvestTurtle')
AddEventHandler('esx_turtle:stopHarvestTurtle', function()

	local _source = source

	PlayersHarvestingTurtle[_source] = false

end)

local function TransformTurtle(source)

	if CopsConnected < Config.RequiredCopsTurtle then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsTurtle)
		return
	end

	SetTimeout(10000, function()

		if PlayersTransformingTurtle[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local turtleQuantity = xPlayer.getInventoryItem('turtle').count
			local poochQuantity = xPlayer.getInventoryItem('turtle_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif turtleQuantity < 10 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_turtle'))
			else
				xPlayer.removeInventoryItem('turtle', 10)
				xPlayer.addInventoryItem('turtle_pooch', 1)
			
				TransformTurtle(source)
			end

		end
	end)
end

RegisterServerEvent('esx_turtle:startTransformTurtle')
AddEventHandler('esx_turtle:startTransformTurtle', function()

	local _source = source

	PlayersTransformingTurtle[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformTurtle(_source)

end)

RegisterServerEvent('esx_turtle:stopTransformTurtle')
AddEventHandler('esx_turtle:stopTransformTurtle', function()

	local _source = source

	PlayersTransformingTurtle[_source] = false

end)

local function SellTurtle(source)

	if CopsConnected < Config.RequiredCopsTurtle then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsTurtle)
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingTurtle[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local poochQuantity = xPlayer.getInventoryItem('turtle_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('turtle_pooch', 1)
				if CopsConnected == 0 then
                    xPlayer.addMoney(250)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_turtle'))
                elseif CopsConnected == 1 then
                    xPlayer.addMoney(250)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_turtle'))
                elseif CopsConnected == 2 then
                    xPlayer.addMoney(250)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_turtle'))
                elseif CopsConnected == 3 then
                    xPlayer.addMoney(250)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_turtle'))
                elseif CopsConnected == 4 then
                    xPlayer.addMoney(250)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_turtle'))
                elseif CopsConnected >= 5 then
                    xPlayer.addMoney(250)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_turtle'))
                end
				
				SellTurtle(source)
			end

		end
	end)
end

RegisterServerEvent('esx_turtle:startSellTurtle')
AddEventHandler('esx_turtle:startSellTurtle', function()

	local _source = source

	PlayersSellingTurtle[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellTurtle(_source)

end)

RegisterServerEvent('esx_turtle:stopSellTurtle')
AddEventHandler('esx_turtle:stopSellTurtle', function()

	local _source = source

	PlayersSellingTurtle[_source] = false

end)


-- RETURN INVENTORY TO CLIENT
RegisterServerEvent('esx_turtle:GetUserInventory')
AddEventHandler('esx_turtle:GetUserInventory', function(currentZone)
	local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_turtle:ReturnInventory', 
    	_source,
		xPlayer.getInventoryItem('turtle').count, 
		xPlayer.getInventoryItem('turtle_pooch').count,
		xPlayer.job.name, 
		currentZone
    )
end)
