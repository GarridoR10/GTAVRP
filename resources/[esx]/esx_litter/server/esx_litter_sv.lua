ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingLitter     = {}
local PlayersTransformingLitter   = {}
local PlayersSellingLitter        = {}

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

--litter
local function HarvestLitter(source)

	if CopsConnected < Config.RequiredCopsLitter then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsLitter)
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingLitter[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local litter = xPlayer.getInventoryItem('litter')

			if litter.limit ~= -1 and litter.count >= litter.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_litter'))
			else
				xPlayer.addInventoryItem('litter', 1)
				HarvestLitter(source)
			end

		end
	end)
end

RegisterServerEvent('esx_litter:startHarvestLitter')
AddEventHandler('esx_litter:startHarvestLitter', function()

	local _source = source

	PlayersHarvestingLitter[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestLitter(_source)

end)

RegisterServerEvent('esx_litter:stopHarvestLitter')
AddEventHandler('esx_litter:stopHarvestLitter', function()

	local _source = source

	PlayersHarvestingLitter[_source] = false

end)

local function TransformLitter(source)

	if CopsConnected < Config.RequiredCopsLitter then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsLitter)
		return
	end

	SetTimeout(10000, function()

		if PlayersTransformingLitter[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local litterQuantity = xPlayer.getInventoryItem('litter').count
			local poochQuantity = xPlayer.getInventoryItem('litter_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif litterQuantity < 10 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_litter'))
			else
				xPlayer.removeInventoryItem('litter', 10)
				xPlayer.addInventoryItem('litter_pooch', 1)
			
				TransformLitter(source)
			end

		end
	end)
end

RegisterServerEvent('esx_litter:startTransformLitter')
AddEventHandler('esx_litter:startTransformLitter', function()

	local _source = source

	PlayersTransformingLitter[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformLitter(_source)

end)

RegisterServerEvent('esx_litter:stopTransformLitter')
AddEventHandler('esx_litter:stopTransformLitter', function()

	local _source = source

	PlayersTransformingLitter[_source] = false

end)

local function SellLitter(source)

	if CopsConnected < Config.RequiredCopsLitter then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsLitter)
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingLitter[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local poochQuantity = xPlayer.getInventoryItem('litter_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('litter_pooch', 1)
				if CopsConnected == 0 then
                    xPlayer.addMoney(20)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_litter'))
                elseif CopsConnected == 1 then
                    xPlayer.addMoney(20)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_litter'))
                elseif CopsConnected == 2 then
                    xPlayer.addMoney(20)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_litter'))
                elseif CopsConnected == 3 then
                    xPlayer.addMoney(20)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_litter'))
                elseif CopsConnected == 4 then
                    xPlayer.addMoney(20)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_litter'))
                elseif CopsConnected >= 5 then
                    xPlayer.addMoney(20)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_litter'))
                end
				
				SellLitter(source)
			end

		end
	end)
end

RegisterServerEvent('esx_litter:startSellLitter')
AddEventHandler('esx_litter:startSellLitter', function()

	local _source = source

	PlayersSellingLitter[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellLitter(_source)

end)

RegisterServerEvent('esx_litter:stopSellLitter')
AddEventHandler('esx_litter:stopSellLitter', function()

	local _source = source

	PlayersSellingLitter[_source] = false

end)


-- RETURN INVENTORY TO CLIENT
RegisterServerEvent('esx_litter:GetUserInventory')
AddEventHandler('esx_litter:GetUserInventory', function(currentZone)
	local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_litter:ReturnInventory', 
    	_source,
		xPlayer.getInventoryItem('litter').count, 
		xPlayer.getInventoryItem('litter_pooch').count,
		xPlayer.job.name, 
		currentZone
    )
end)
