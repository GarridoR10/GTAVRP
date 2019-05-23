ESX = nil
local connectedPlayers = {}
local playerJobs = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_scoreboard:getConnectedPlayers', function(source, cb)
	cb(connectedPlayers)
end)

AddEventHandler('esx:setJob', function(playerId, job, lastJob)
	connectedPlayers[playerId].job = job.name
	connectedPlayers[playerId].jobLabel = job.label
	
	TriggerClientEvent('esx_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	AddPlayersToScoreboard()
end)

AddEventHandler('esx:playerDropped', function(playerId)
	connectedPlayers[playerId] = nil
	TriggerClientEvent('esx_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		UpdatePing()
	end
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.CreateThread(function()
			Citizen.Wait(1000)
			AddPlayersToScoreboard()
		end)
	end
end)

function AddPlayerToScoreboard(xPlayer, update)
	local playerId = xPlayer.source

	local identifier = GetPlayerIdentifiers(playerId)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier })
	
	local firstname = result[1].firstname
	local lastname = result[1].lastname
	local phone	= result[1].phone_number
	
	connectedPlayers[playerId] = {}
	connectedPlayers[playerId].ping = GetPlayerPing(playerId)
	connectedPlayers[playerId].id = playerId
	connectedPlayers[playerId].name = firstname .. " " .. lastname
	connectedPlayers[playerId].phone = phone
	connectedPlayers[playerId].job = xPlayer.job.name
	connectedPlayers[playerId].jobLabel = xPlayer.job.label

	if update then
		TriggerClientEvent('esx_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
	end
	
	if xPlayer.player.getGroup() == 'user' then
		Citizen.CreateThread(function()
			TriggerClientEvent('esx_scoreboard:toggleID', playerId, tostring(Config.UserVisibleID))
		end)
	end
	
	if xPlayer.player.getGroup() == 'user' then
		Citizen.CreateThread(function()
			TriggerClientEvent('esx_scoreboard:toggleJob', playerId, tostring(Config.ShowJobs))
		end)
	end
end

function AddPlayersToScoreboard()
	local players = ESX.GetPlayers()
	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		AddPlayerToScoreboard(xPlayer, true)
	end
	TriggerClientEvent('esx_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
end

function UpdatePing()
	for k,v in pairs(connectedPlayers) do
		v.ping = GetPlayerPing(k)
		
		local xPlayer = ESX.GetPlayerFromId(k)
		
		if v.name == " " then
			AddPlayerToScoreboard(xPlayer, true)
		end
		
		if xPlayer.player.getGroup() == 'user' then
			Citizen.CreateThread(function()
				TriggerClientEvent('esx_scoreboard:toggleID', k, tostring(Config.UserVisibleID))
			end)
		end
		
		if xPlayer.player.getGroup() == 'user' then
			Citizen.CreateThread(function()
				TriggerClientEvent('esx_scoreboard:toggleJob', k, tostring(Config.ShowJobs))
			end)
		end
		
	end
	TriggerClientEvent('esx_scoreboard:updatePing', -1, connectedPlayers)
end

TriggerEvent('es:addGroupCommand', 'screfresh', 'superadmin', function(source, args, user)
	AddPlayersToScoreboard()
end)

TriggerEvent('es:addGroupCommand', 'scid', 'admin', function(source, args, user)
	TriggerClientEvent('esx_scoreboard:toggleID', source, args[1])
end)

TriggerEvent('es:addGroupCommand', 'scjob', 'admin', function(source, args, user)
	TriggerClientEvent('esx_scoreboard:toggleJob', source, args[1])
end)
