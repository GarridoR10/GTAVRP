----------------------
-- Author : Deediezi
-- Version 4.5
--
-- Contributors : No contributors at the moment.
--
-- Github link : https://github.com/Deediezi/FiveM_LockSystem
-- You can contribute to the project. All the information is on Github.

--  Main algorithm with all functions and events - Client side

----
-- @var vehicles[plate_number] = newVehicle Object
local vehicles 	= {}
ESX				= nil
localVehId		= 0
savedVehicle	= 0
isTheCarOwner = false

---- Retrieve the keys of a player when he reconnects.
-- The keys are synchronized with the server. If you restart the server, all keys disappear.
AddEventHandler("playerSpawned", function()
    TriggerServerEvent("esx_locksystem:retrieveVehiclesOnconnect")
end)

---- Main thread
-- The logic of the script is here
Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
    while true do
        Wait(0)

        -- If the defined key is pressed
        if(IsControlJustPressed(1, 42))then
			doLockSystemToggleLocks()
        end
    end
end)

function doLockSystemToggleLocks()
	-- Init player infos
	local ply = GetPlayerPed(-1)
	local pos = GetEntityCoords(ply)
	local vehicle = GetClosestVehicle(pos['x'], pos['y'], pos['z'], 5.001, 0, 70)
	isInside = false
	
	-- Retrieve the local ID of the targeted vehicle
	if(IsPedInAnyVehicle(ply, true))then
		-- by sitting inside him
		localVehId = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		isInside = true
	else
		if (vehicle ~= 0) then
			
			localVehId = vehicle
			savedVehicle = vehicle
		elseif (vehicle ~= 0) and (savedVehicle == vehicle) then
			localVehId = vehicle	
		elseif (vehicle == 0) then
			localVehId = savedVehicle
		end
	end
		
	-- Get targeted vehicle infos
	if(localVehId and localVehId ~= 0)then
		local localVehPlateTest = GetVehicleNumberPlateText(localVehId)
		if localVehPlateTest ~= nil then
			local localVehPlate = string.lower(localVehPlateTest)
			local newVehPlate = string.gsub(tostring(localVehPlate), "%s", "")
			local localVehLockStatus = GetVehicleDoorLockStatus(localVehId)
			local hasKey = false
			local myID = GetPlayerServerId(PlayerId())
			TriggerServerEvent("esx_locksystem:haveKeys", myID, newVehPlate)
			if isTheCarOwner then
							if(time > timer)then
								if(IsPedInAnyVehicle(ply, true))then
									if localVehLockStatus <= 2 then
										SetVehicleDoorsLocked(localVehId, 4)
										SetVehicleDoorsLockedForAllPlayers(localVehId, 1)
										TriggerEvent("esx_locksystem:notify", _U("vehicle_locked"))
										TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "lock", 0.5)
										time = 0
									elseif localVehLockStatus > 2 then
										SetVehicleDoorsLocked(localVehId, 1)
										SetVehicleDoorsLockedForAllPlayers(localVehId, false)
										TriggerEvent("esx_locksystem:notify", _U("vehicle_unlocked"))
										TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "unlock", 0.5)
										time = 0
									end
								else
									if localVehLockStatus <= 2 then
									
										local lib = "anim@mp_player_intmenu@key_fob@"
										local anim = "fob_click"
				
										ESX.Streaming.RequestAnimDict(lib, function()
											TaskPlayAnim(ply, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
										end)

										Wait(250)
										SetVehicleDoorsLocked(localVehId, 4)
										SetVehicleDoorsLockedForAllPlayers(localVehId, 1)
										TriggerEvent("esx_locksystem:notify", _U("vehicle_locked"))
										TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "lock2", 0.5)
										time = 0
									elseif localVehLockStatus > 2 then
									
										local lib = "anim@mp_player_intmenu@key_fob@"
										local anim = "fob_click"
					
										ESX.Streaming.RequestAnimDict(lib, function()
											TaskPlayAnim(ply, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
										end)

										Wait(250)
									
										SetVehicleDoorsLocked(localVehId, 1)
										SetVehicleDoorsLockedForAllPlayers(localVehId, false)
										TriggerEvent("esx_locksystem:notify", _U("vehicle_unlocked"))
										TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "lock2", 0.5)
										time = 0
									end
								end
							else
								TriggerEvent("esx_locksystem:notify", _U("lock_cooldown", (timer / 1000)))
							end
			else
				-- If the vehicle appear in the table (if this is the player's vehicle or a locked vehicle)
				for plate, vehicle in pairs(vehicles) do
					if(string.lower(plate) == localVehPlate)then
						-- If the vehicle is not locked (this is the player's vehicle)
						if(vehicle ~= "locked")then
							hasKey = true
							if(time > timer)then
								-- update the vehicle infos (Useful for hydrating instances created by the /givekey command)
								vehicle.update(localVehId, localVehLockStatus)
								-- Lock or unlock the vehicle
								if(IsPedInAnyVehicle(ply, true))then
									vehicle.lock()
									time = 0
								else
									local lib = "anim@mp_player_intmenu@key_fob@"
									local anim = "fob_click"
				
									ESX.Streaming.RequestAnimDict(lib, function()
										TaskPlayAnim(ply, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
									end)

									Wait(250)
									vehicle.lock()
									time = 0
								end
							else
								TriggerEvent("esx_locksystem:notify", _U("lock_cooldown", (timer / 1000)))
							end
						else
							TriggerEvent("esx_locksystem:notify", _U("keys_not_inside"))
						end
					end
				end

				-- If the player doesn't have the keys
				if(not hasKey)then
				-- If the player is inside the vehicle
					if(isInside)then
						-- If the player find the keys
						if(canSteal())then
							-- Check if the vehicle is already owned.
							-- And send the parameters to create the vehicle object if this is not the case.
							TriggerServerEvent('esx_locksystem:checkOwner', localVehId, localVehPlate, localVehLockStatus)
						else
							-- If the player doesn't find the keys
							-- Lock the vehicle (players can't try to find the keys again)
							vehicles[localVehPlate] = "locked"
							TriggerServerEvent("esx_locksystem:lockTheVehicle", localVehPlate)
							TriggerEvent("esx_locksystem:notify", _U("keys_not_inside"))
						end
					end
				end
			end
		else
			TriggerEvent("esx_locksystem:notify", _U("could_not_find_plate"))
		end
	end
end

---- Timer
Citizen.CreateThread(function()
    timer = Config.lockTimer * 1000
    time = 0
	while true do
		Wait(1000)
		time = time + 1000
	end
end)

---- Prevents the player from breaking the window if the vehicle is locked
-- (fixing a bug in the previous version)
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local ped = GetPlayerPed(-1)
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
        	local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
	        local lock = GetVehicleDoorLockStatus(veh)
	        if lock == 4 then
	        	ClearPedTasks(ped)
	        end
        end
	end
end)

---- Locks vehicles if non-playable characters are in them
-- Can be disabled in "config/shared.lua"
if(Config.disableCar_NPC)then
    Citizen.CreateThread(function()
        while true do
            Wait(0)
            local ped = GetPlayerPed(-1)
            if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
                local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
                local lock = GetVehicleDoorLockStatus(veh)
                if lock == 7 then
                    SetVehicleDoorsLocked(veh, 2)
                end
                local pedd = GetPedInVehicleSeat(veh, -1)
                if pedd then
                    SetPedCanBeDraggedOut(pedd, false)
                end
            end
        end
    end)
end

------------------------    EVENTS      ------------------------
------------------------     :)         ------------------------

RegisterNetEvent("esx_locksystem:setIsOwner")
AddEventHandler("esx_locksystem:setIsOwner", function(callback)
	if callback == true then
		isTheCarOwner = true
	else
		isTheCarOwner = false
	end	
end)

---- Update a vehicle plate (for developers)
-- @param string oldPlate
-- @param string newPlate
RegisterNetEvent("esx_locksystem:updateVehiclePlate")
AddEventHandler("esx_locksystem:updateVehiclePlate", function(oldPlate, newPlate)
    local oldPlate = string.lower(oldPlate)
    local newPlate = string.lower(newPlate)

    if(vehicles[oldPlate])then
        vehicles[newPlate] = vehicles[oldPlate]
        vehicles[oldPlate] = nil

        TriggerServerEvent("esx_locksystem:updateServerVehiclePlate", oldPlate, newPlate)
    end
end)

---- Event called from the server
-- Get the keys and create the vehicle Object if the vehicle has no owner
-- @param boolean hasOwner
-- @param int localVehId
-- @param string localVehPlate
-- @param int localVehLockStatus
RegisterNetEvent("esx_locksystem:getHasOwner")
AddEventHandler("esx_locksystem:getHasOwner", function(hasOwner, localVehId, localVehPlate, localVehLockStatus)
    if(not hasOwner)then
        TriggerEvent("esx_locksystem:newVehicle", localVehPlate, localVehId, localVehLockStatus)
        TriggerServerEvent("esx_locksystem:addOwner", localVehPlate)

        TriggerEvent("esx_locksystem:notify", getRandomMsg())
    else
        TriggerEvent("esx_locksystem:notify", _U("vehicle_not_owned"))
    end
end)

---- Create a new vehicle object
-- @param int id [opt]
-- @param string plate
-- @param string lockStatus [opt]
RegisterNetEvent("esx_locksystem:newVehicle")
AddEventHandler("esx_locksystem:newVehicle", function(plate, id, lockStatus)
    if(plate)then
        local plate = string.lower(plate)
        if(not id)then id = nil end
        if(not lockStatus)then lockStatus = nil end
        vehicles[plate] = newVehicle()
        vehicles[plate].__construct(plate, id, lockStatus)
    else
        print("Can't create the vehicle instance. Missing argument PLATE")
    end
end)

---- Event called from server when a player execute the /givekey command
-- Create a new vehicle object with its plate
-- @param string plate
RegisterNetEvent("esx_locksystem:giveKeys")
AddEventHandler("esx_locksystem:giveKeys", function(plate)
    local plate = string.lower(plate)
    TriggerEvent("esx_locksystem:newVehicle", plate, nil, nil)
end)

---- Piece of code from Scott's InteractSound script : https://forum.fivem.net/t/release-play-custom-sounds-for-interactions/8282
-- I've decided to use only one part of its script so that administrators don't have to download more scripts. I hope you won't forget to thank him!
RegisterNetEvent('InteractSound_CL:PlayWithinDistance')
AddEventHandler('InteractSound_CL:PlayWithinDistance', function(playerNetId, maxDistance, soundFile, soundVolume)
    local lCoords = GetEntityCoords(localVehId, false)
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
	local farSound
    if(distIs < maxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
	elseif distIs >= maxDistance and distIs < 15.0 then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = 0.25
        })
	elseif distIs >= 15.0 and distIs < 30.0 then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = 0.15
        })
	elseif distIs >= 30.0 and distIs < 50.0 then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = 0.05
        })
    end
end)

RegisterNetEvent('esx_locksystem:notify')
AddEventHandler('esx_locksystem:notify', function(text, duration)
	Notify(text, duration)
end)

------------------------    FUNCTIONS      ------------------------
------------------------        :O         ------------------------

---- A simple algorithm that checks if the player finds the keys or not.
-- @return boolean
function canSteal()
    nb = math.random(1, 100)
    percentage = Config.percentage
    if(nb < percentage)then
        return true
    else
        return false
    end
end

---- Return a random message
-- @return string
function getRandomMsg()
    msgNb = math.random(1, #Config.randomMsg)
    return Config.randomMsg[msgNb]
end

---- Get a vehicle in direction
-- @param array coordFrom
-- @param array coordTo
-- @return int
function GetVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end

---- Get the vehicle in front of the player
-- @param array pCoords
-- @param int ply
-- @return int
function GetTargetedVehicle(pCoords, ply)
    for i = 1, 200 do
        coordB = GetOffsetFromEntityInWorldCoords(ply, 0.0, (6.281)/i, 0.0)
        targetedVehicle = GetVehicleInDirection(pCoords, coordB)
        if(targetedVehicle ~= nil and targetedVehicle ~= 0)then
            return targetedVehicle
        end
    end
    return
end

---- Notify the player
-- Can be configured in "config/shared.lua"
-- @param string text
-- @param float duration [opt]
function Notify(text, duration)
	if(Config.notification)then
		if(Config.notification == 1)then
			if(not duration)then
				duration = 0.080
			end
			SetNotificationTextEntry("STRING")
			AddTextComponentString(text)
			Citizen.InvokeNative(0x1E6611149DB3DB6B, "CHAR_LIFEINVADER", "CHAR_LIFEINVADER", true, 1, "ESX LockSystem" .. _VERSION, "\"Lock All Your Doors\"", duration)
			DrawNotification_4(false, true)
		elseif(Config.notification == 2)then
			TriggerEvent('chatMessage', '^1ESX LockSystem' .. _VERSION, {255, 255, 255}, text)
		else
			return
		end
	else
		return
	end
end

RegisterNetEvent('esx_aiomenu:sendProximityMessageID')
AddEventHandler('esx_aiomenu:sendProximityMessageID', function(id, message)
	local myId = PlayerId()
	local pid = GetPlayerFromServerId(id)
	if pid == myId then
		TriggerEvent('chatMessage', "[ID]" .. "", {0, 153, 204}, "^7 " .. message)
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
		TriggerEvent('chatMessage', "[ID]" .. "", {0, 153, 204}, "^7 " .. message)
	end
end)
