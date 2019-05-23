ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('coke_pooch', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local _source  = source

	TriggerClientEvent('esx_addonneeds:cokeeffect', _source)
	xPlayer.removeInventoryItem('coke_pooch', 1)
	TriggerClientEvent('esx:showNotification', _source, 'Tu à sniffer un peu de coke')
end)
