characters = {}
ESX	= nil

AddEventHandler('esx:getSharedObject', function(cb)
	cb(ESX)
end)

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getSharedObject()
	return ESX
end

AddEventHandler('es:playerLoaded', function(source)
	local myID = {
		steamid = GetPlayerIdentifiers(source)[1],
		playerid = source
	}

	TriggerClientEvent('esx_aiomenu:saveID', source, myID)
end)

function getIdentity(source, callback)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier",
	{
		['@identifier'] = identifier
	},
	function(result)
		if result[1] ~= nil then
			local data = {
				identifier	= identifier,
				firstname	= result[1]['firstname'],
				lastname	= result[1]['lastname'],
				dateofbirth	= result[1]['dateofbirth'],
				sex			= result[1]['sex'],
				height		= result[1]['height'],
				phonenumber = result[1]['phone_number']
			}
			
			callback(data)
		else	
			local data = {
				identifier 	= '',
				firstname 	= '',
				lastname 	= '',
				dateofbirth = '',
				sex 		= '',
				height 		= '',
				phonenumber = ''
			}
			
			callback(data)
		end
	end)
end

function getCharacters(source, callback)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier",
	{
		['@identifier'] = identifier
	},
	function(result)
		if result[1] then
			local data = {
				identifier    = result[1]['identifier'],
				firstname    = result[1]['firstname'],
				lastname    = result[1]['lastname'],
				dateofbirth  = result[1]['dateofbirth'],
				sex      = result[1]['sex'],
				height     = result[1]['height']
			}

			callback(data)
		else
			local data = {
				identifier    = '',
				firstname    = '',
				lastname    = '',
				dateofbirth  = '',
				sex      = '',
				height      = ''
			}

			callback(data)
		end
	end)
end

function getChars(steamid, callback)
	MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier",
	{
		['@identifier'] = steamid
	},
	function(result)
		if result[1] then
			local data = {
				identifier    = result[1]['identifier'],
				firstname    = result[1]['firstname'],
				lastname    = result[1]['lastname'],
				dateofbirth  = result[1]['dateofbirth'],
				sex      = result[1]['sex'],
				height      = result[1]['height']
			}

			callback(data)
		else
			local data = {
				identifier    = '',
				firstname     = '',
				lastname    = '',
				dateofbirth  = '',
				sex     = '',
				height      = ''
			}

			callback(data)
		end
	end)
end

function getID(steamid, callback)
	MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier",
	{
		['@identifier'] = steamid
	},
	function(result)
		if result[1] ~= nil then
			local data = {
				identifier	= identifier,
				firstname	= result[1]['firstname'],
				lastname	= result[1]['lastname'],
				dateofbirth	= result[1]['dateofbirth'],
				sex			= result[1]['sex'],
				height		= result[1]['height'],
				phonenumber = result[1]['phone_number']
			}
			
			callback(data)
		else	
			local data = {
				identifier 	= '',
				firstname 	= '',
				lastname 	= '',
				dateofbirth = '',
				sex 		= '',
				height 		= '',
				phonenumber = ''
			}
			
			callback(data)
		end
	end)
end

function updateIdentity(identifier, data, callback)
	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
end

function deleteIdentity(identifier, data, callback)
	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@firstname']		= '',
		['@lastname']		= '',
		['@dateofbirth']	= '',
		['@sex']			= '',
		['@height']			= ''
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
end

RegisterServerEvent('esx_aiomenu:id')
AddEventHandler('esx_aiomenu:id', function(myIdentifiers)
	getID(myIdentifiers.steamidentifier, function(data)
		if data ~= nil then
			TriggerClientEvent("esx_aiomenu:sendProximityMessageID", -1, myIdentifiers.playerid, data.firstname .. " " .. data.lastname)
		end
	end)
end)

RegisterNetEvent('esx_aiomenu:phone')
AddEventHandler('esx_aiomenu:phone', function(myIdentifiers)
	getID(myIdentifiers.steamidentifier, function(data)
		if data ~= nil then
			local name = data.firstname .. " " .. data.lastname
			TriggerClientEvent("esx_aiomenu:sendProximityMessagePhone", -1, myIdentifiers.playerid, name, data.phonenumber)
		end
	end)
end)

function getPlayerID(source)
	local identifiers = GetPlayerIdentifiers(source)
	local player = getIdentifiant(identifiers)
	return player
end

function getIdentifiant(id)
	for _, v in ipairs(id) do
		return v
	end
end

AddEventHandler('es:playerLoaded', function(source)
	local steamid = GetPlayerIdentifiers(source)[1]
  
	getCharacters(source, function(data)
		if data ~= nil then
			if data.firstname ~= '' then
				local charName 		= tostring(data.firstname) .. " " .. tostring(data.lastname)
				local charDOB 		= tostring(data.dateofbirth)
				local charSex		= tostring(data.sex)
				local charHeight	= tostring(data.height)

				identification = {
					steamidentifier = steamid,
					playerid        = source
				}
		
		      	characterInfo = {
					characterName       = charName,
					characterDOB		= charDOB,
					characterSex		= charSex,
					characterHeight		= charHeight
				}
		  
				TriggerClientEvent('esx_aiomenu:setChar', source, characterInfo)	
				TriggerClientEvent('esx_aiomenu:setIdentifier', source, identification)
		
			else
				local charName = "No Character"
		
				identification = {
					steamidentifier = steamid,
					playerid        = source
				}
		
		      	characterInfo = {
					characterName       = charName,
					characterDOB		= "",
					characterSex		= "",
					characterHeight		= ""
				}
		  
				TriggerClientEvent('esx_aiomenu:setChar', source, characterInfo)	
				TriggerClientEvent('esx_aiomenu:setIdentifier', source, identification)		
		
			end
		end
	end)
end)

RegisterServerEvent('esx_aiomenu:setCharacter')
AddEventHandler('esx_aiomenu:setCharacter', function(myIdentifiers)
	getChars(myIdentifiers.steamidentifier, function(data)	
		if data ~= nil then
			if data.firstname ~= '' then
				local charName 		= tostring(data.firstname) .. " " .. tostring(data.lastname)
				local charDOB 		= tostring(data.dateofbirth)
				local charSex		= tostring(data.sex)
				local charHeight	= tostring(data.height)
		      	characterInfo = {
					characterName       = charName,
					characterDOB		= charDOB,
					characterSex		= charSex,
					characterHeight		= charHeight
				}
			
				TriggerClientEvent('esx_aiomenu:setChar', myIdentifiers.playerid, characterInfo)
			else	
		      	characterInfo = {
					characterName       = "No Character",
					characterDOB		= "",
					characterSex		= "",
					characterHeight		= ""
				}
				TriggerClientEvent('esx_aiomenu:setChar', myIdentifiers.playerid, characterInfo)  
			end
		end
	end)
end)


RegisterServerEvent('esx_aiomenu:deleteCharacter')
AddEventHandler('esx_aiomenu:deleteCharacter', function(myIdentifiers)
	getChars(myIdentifiers.steamidentifier, function(data)
		local data = {
			identifier   = data.identifier,
			firstname  = data.firstname,
			lastname  = data.lastname,
			dateofbirth  = data.dateofbirth,
			sex      = data.sex,
			height    = data.height
		}
	
		if data.firstname ~= '' then
			deleteIdentity(myIdentifiers.steamidentifier, data, function(callback)
				if callback == true then
					TriggerClientEvent('esx_aiomenu:successfulDeleteIdentity', myIdentifiers.playerid, data)
				else
					TriggerClientEvent('esx_aiomenu:failedDeleteIdentity', myIdentifiers.playerid, data)
				end
			end)
		else
			TriggerClientEvent('esx_aiomenu:noIdentity', myIdentifiers.playerid, {})
		end
	end)
end)

RegisterServerEvent('esx_aiomenu:showID')
AddEventHandler('esx_aiomenu:showID', function(ID, targetID)

	local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source 	 = ESX.GetPlayerFromId(targetID).source

	MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier",
	{
		['@identifier'] = identifier
	}, function(result)
		if result[1] ~= nil then
			if result[1].firstname ~= '' then
				local data 			= result[1]
				local charName 		= tostring(data.firstname) .. " " .. tostring(data.lastname)
				local charDOB 		= tostring(data.dateofbirth)
				local charSex		= tostring(data.sex)
				local charHeight	= tostring(data.height)
				
		      	info = {
					characterName       = charName,
					characterDOB		= charDOB,
					characterSex		= charSex,
					characterHeight		= charHeight
				}
				TriggerClientEvent('esx_aiomenu:showID', _source, info)
			else
				TriggerClientEvent("esx_aiomenu:sendProximityMessageID", -1, ID, "You sent an invalid ID.")
			end
		end
	end)
end)

if Config.versionChecker then
    PerformHttpRequest("https://raw.githubusercontent.com/ArkSeyonet/esx_aiomenu/master/VERSION", function(err, rText, headers)
		if rText then
			if tonumber(rText) > tonumber(_VERSION) then
				print("\n---------------------------------------------------")
				print("ESX AIOMenu has an update available!")
				print("---------------------------------------------------")
				print("Current : " .. _VERSION)
				print("Latest  : " .. rText .. "\n")
			end
		else
			print("\n---------------------------------------------------")
			print("Unable to find the version.")
			print("---------------------------------------------------\n")
		end
	end, "GET", "", {what = 'this'})
end

