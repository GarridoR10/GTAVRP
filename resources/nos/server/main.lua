ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('nitro', function(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
    local nitroquantity = xPlayer.getInventoryItem('nitro').count
    if nitroquantity > 0 then
        TriggerClientEvent('hypr9speed:activar', source)
    else
        TriggerClientEvent('esx:showNotification', source, "Algo va mal.")
    end
end)

RegisterServerEvent('hypr9speed:removeInventoryItem')
AddEventHandler('hypr9speed:removeInventoryItem', function(item, quantity)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, quantity)
end)