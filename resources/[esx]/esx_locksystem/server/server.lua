----------------------
-- Author : Deediezi
-- Version 4.5
--
-- Contributors : No contributors at the moment.
--
-- Github link : https://github.com/Deediezi/FiveM_LockSystem
-- You can contribute to the project. All the information is on Github.

--  Server side

owners = {} -- owners[plate] = identifier
secondOwners = {} -- secondOwners[plate] = {identifier, identifier, ...}
MySQL.ready(function ()
    MySQL.Async.fetchAll("SELECT `plate`, `owner` FROM owned_vehicles",{}, function(data)
        for k,v in pairs(data) do
            local plate = string.lower(v.plate)
            owners[plate] = v.owner
        end
    end)
end)

AddEventHandler('es:playerLoaded', function(source)
    MySQL.Async.fetchAll("SELECT `plate`, `owner` FROM owned_vehicles",{}, function(data)
        for k,v in pairs(data) do
            local plate = string.lower(v.plate)
            owners[plate] = v.owner
        end
    end)
end)

RegisterServerEvent("esx_locksystem:retrieveVehiclesOnconnect")
AddEventHandler("esx_locksystem:retrieveVehiclesOnconnect", function()
    local src = source
    local srcIdentifier = GetPlayerIdentifiers(src)[1]
    local data = MySQL.Sync.fetchAll("SELECT `plate`, `owner` FROM owned_vehicles",{})
    for k,v in pairs(data) do
        local plate = string.lower(v.plate)
        owners[plate] = v.owner
    end
    for plate, plyIdentifier in pairs(owners) do
        if(plyIdentifier == srcIdentifier)then
            local _plate = plate
            TriggerClientEvent("esx_locksystem:newVehicle", src, _plate, nil, nil)
        end
    end

    for plate, identifiers in pairs(secondOwners) do
        for k, plyIdentifier in ipairs(identifiers) do
            if(plyIdentifier == srcIdentifier)then
                TriggerClientEvent("esx_locksystem:newVehicle", src, plate, nil, nil)
            end
        end
    end
end)

RegisterServerEvent("esx_locksystem:addOwner")
AddEventHandler("esx_locksystem:addOwner", function(plate)
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]
    local plate = string.lower(plate)

    owners[plate] = identifier
end)

RegisterServerEvent("esx_locksystem:addOwnerWithIdentifier")
AddEventHandler("esx_locksystem:addOwnerWithIdentifier", function(targetIdentifier, plate)
    local plate = string.lower(plate)

    owners[plate] = targetIdentifier
end)

RegisterServerEvent("esx_locksystem:addSecondOwner")
AddEventHandler("esx_locksystem:addSecondOwner", function(targetIdentifier, plate)
    local plate = string.lower(plate)

    if(secondOwners[plate])then
        table.insert(secondOwners[plate], targetIdentifier)
    else
        secondOwners[plate] = {targetIdentifier}
    end
end)

RegisterNetEvent("esx_locksystem:checkOwner")
AddEventHandler("esx_locksystem:checkOwner", function(localVehId, plate, lockStatus)
    local plate = string.lower(plate)
    local src = source
    local hasOwner = false
    local identifier = GetPlayerIdentifiers(src)[1]
    if(not owners[plate])then
        TriggerClientEvent("esx_locksystem:getHasOwner", src, nil, localVehId, plate, lockStatus)
    else
        if(owners[plate] == "locked")then
            TriggerClientEvent("esx_locksystem:notify", src, _U('keys_not_inside'))
        else
            if(identifier == owners[plate]) then
                TriggerClientEvent("esx_locksystem:getHasOwner", src, nil, localVehId, plate, lockStatus)
            else
                TriggerClientEvent("esx_locksystem:getHasOwner", src, true, localVehId, plate, lockStatus)
            end
        end
    end
end)

RegisterServerEvent("esx_locksystem:lockTheVehicle")
AddEventHandler("esx_locksystem:lockTheVehicle", function(plate)
    owners[plate] = "locked"
end)

RegisterServerEvent("esx_locksystem:haveKeys")
AddEventHandler("esx_locksystem:haveKeys", function(myID, localVehPlate)
    targetIdentifier = GetPlayerIdentifiers(myID)[1]
    local hasKey = false

    for plate, identifier in pairs(owners) do
        if(string.gsub(tostring(plate), "%s", "") == localVehPlate and identifier == targetIdentifier)then
			
            hasKey = true
            break
        end
    end
	for plate, identifiers in pairs(secondOwners) do
        if(string.gsub(tostring(plate), "%s", "") == localVehPlate)then
           for k, plyIdentifier in ipairs(identifiers) do
               if(plyIdentifier == targetIdentifier)then
                   hasKey = true
                    break
                end
			end
		end
	end

    if hasKey == true then
		callback = true
		TriggerClientEvent("esx_locksystem:setIsOwner", myID, callback)
    else
		callback = false
		TriggerClientEvent("esx_locksystem:setIsOwner", myID, callback)
    end
end)

function getKey(PlayerID, newPlate, cb)
	targetIdentifier = GetPlayerIdentifiers(PlayerID)[1]
	vehPlate = newPlate
    hasKey = false

    for plate, identifier in pairs(owners) do
        if(plate == vehPlate and identifier == targetIdentifier)then
            hasKey = true
            break
        end
    end
    for plate, identifiers in pairs(secondOwners) do
        if(plate == vehPlate)then
            for k, plyIdentifier in ipairs(identifiers) do
                if(plyIdentifier == targetIdentifier)then
                    hasKey = true
                    break
                end
            end
        end
    end
	

    if hasKey == true then
        cb = true
		return cb
    else
		cb = false
        return cb
    end
end

RegisterServerEvent("esx_locksystem:updateServerVehiclePlate")
AddEventHandler("esx_locksystem:updateServerVehiclePlate", function(oldPlate, newPlate)
    local oldPlate = string.lower(oldPlate)
    local newPlate = string.lower(newPlate)

    if(owners[oldPlate] and not owners[newPlate])then
        owners[newPlate] = owners[oldPlate]
        owners[oldPlate] = nil
    end
    if(secondOwners[oldPlate] and not secondOwners[newPlate])then
        secondOwners[newPlate] = secondOwners[oldPlate]
        secondOwners[oldPlate] = nil
    end
end)

-- Piece of code from Scott's InteractSound script : https://forum.fivem.net/t/release-play-custom-sounds-for-interactions/8282
RegisterServerEvent('InteractSound_SV:PlayWithinDistance')
AddEventHandler('InteractSound_SV:PlayWithinDistance', function(maxDistance, soundFile, soundVolume)
    TriggerClientEvent('InteractSound_CL:PlayWithinDistance', -1, source, maxDistance, soundFile, soundVolume)
end)
