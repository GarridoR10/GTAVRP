time = {h = 0, m = 0, s = 0}

RegisterServerEvent("ts:newplayer")
AddEventHandler("ts:newplayer", function()
    TriggerClientEvent("ts:timesync", source, time)
end)

RegisterServerEvent("ts:timesync")
AddEventHandler("ts:timesync", function(newTime)
    time = newTime
end)