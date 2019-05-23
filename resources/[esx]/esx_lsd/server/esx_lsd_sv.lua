ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingLsd     = {}
local PlayersTransformingLsd   = {}
local PlayersSellingLsd        = {}

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

--lsd
local function HarvestLsd(source)

	if CopsConnected < Config.RequiredCopsLsd then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsLsd)
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingLsd[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local lsd = xPlayer.getInventoryItem('lsd')

			if lsd.limit ~= -1 and lsd.count >= lsd.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_lsd'))
			else
				xPlayer.addInventoryItem('lsd', 1)
				HarvestLsd(source)
			end

		end
	end)
end

RegisterServerEvent('esx_lsd:startHarvestLsd')
AddEventHandler('esx_lsd:startHarvestLsd', function()

	local _source = source

	PlayersHarvestingLsd[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestLsd(_source)

end)

RegisterServerEvent('esx_lsd:stopHarvestLsd')
AddEventHandler('esx_lsd:stopHarvestLsd', function()

	local _source = source

	PlayersHarvestingLsd[_source] = false

end)

local function TransformLsd(source)

	if CopsConnected < Config.RequiredCopsLsd then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsLsd)
		return
	end

	SetTimeout(10000, function()

		if PlayersTransformingLsd[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local lsdQuantity = xPlayer.getInventoryItem('lsd').count
			local poochQuantity = xPlayer.getInventoryItem('lsd_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif lsdQuantity < 10 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_lsd'))
			else
				xPlayer.removeInventoryItem('lsd', 10)
				xPlayer.addInventoryItem('lsd_pooch', 1)
			
				TransformLsd(source)
			end

		end
	end)
end

RegisterServerEvent('esx_lsd:startTransformLsd')
AddEventHandler('esx_lsd:startTransformLsd', function()

	local _source = source

	PlayersTransformingLsd[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformLsd(_source)

end)

RegisterServerEvent('esx_lsd:stopTransformLsd')
AddEventHandler('esx_lsd:stopTransformLsd', function()

	local _source = source

	PlayersTransformingLsd[_source] = false

end)

local function SellLsd(source)

	if CopsConnected < Config.RequiredCopsLsd then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsLsd)
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingLsd[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local poochQuantity = xPlayer.getInventoryItem('lsd_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('lsd_pooch', 1)
				if CopsConnected == 0 then
                    xPlayer.addAccountMoney('black_money', 220)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_lsd'))
                elseif CopsConnected == 1 then
                    xPlayer.addAccountMoney('black_money', 220)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_lsd'))
                elseif CopsConnected == 2 then
                    xPlayer.addAccountMoney('black_money', 220)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_lsd'))
                elseif CopsConnected == 3 then
                    xPlayer.addAccountMoney('black_money', 220)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_lsd'))
                elseif CopsConnected == 4 then
                    xPlayer.addAccountMoney('black_money', 220)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_lsd'))
                elseif CopsConnected >= 5 then
                    xPlayer.addAccountMoney('black_money', 220)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_lsd'))
                end
				
				SellLsd(source)
			end

		end
	end)
end

RegisterServerEvent('esx_lsd:startSellLsd')
AddEventHandler('esx_lsd:startSellLsd', function()

	local _source = source

	PlayersSellingLsd[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellLsd(_source)

end)

RegisterServerEvent('esx_lsd:stopSellLsd')
AddEventHandler('esx_lsd:stopSellLsd', function()

	local _source = source

	PlayersSellingLsd[_source] = false

end)


-- RETURN INVENTORY TO CLIENT
RegisterServerEvent('esx_lsd:GetUserInventory')
AddEventHandler('esx_lsd:GetUserInventory', function(currentZone)
	local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_lsd:ReturnInventory', 
    	_source,
		xPlayer.getInventoryItem('lsd').count, 
		xPlayer.getInventoryItem('lsd_pooch').count,
		xPlayer.job.name, 
		currentZone
    )
end)
