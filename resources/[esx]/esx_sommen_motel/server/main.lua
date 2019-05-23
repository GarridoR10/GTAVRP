ESX = nil

TriggerEvent('esx:getSharedObject', function(object)
	ESX = object
end)

ESX.RegisterServerCallback('esx_sommen_motel:getInventory', function(source, callback)
  	local player = ESX.GetPlayerFromId(source)

  	if player ~= nil then
	  	callback(player.inventory)
	end
end)

ESX.RegisterServerCallback('esx_sommen_motel:addItem', function(source, callback, item, amount)
	local player = ESX.GetPlayerFromId(source)

	if player ~= nil then
		player.addInventoryItem(item, amount)
	end

	callback()
end)

ESX.RegisterServerCallback('esx_sommen_motel:removeItem', function(source, callback, item, amount)
	local player = ESX.GetPlayerFromId(source)

	if player ~= nil then
		player.removeInventoryItem(item, amount)
	end

	callback()
end)

ESX.RegisterServerCallback('esx_sommen_motel:getDirtyMoney', function(source, callback)
	local player = ESX.GetPlayerFromId(source)

	if player ~= nil then
		callback(player.getAccount('black_money').money)
	else
		callback(0)
	end
end)

ESX.RegisterServerCallback('esx_sommen_motel:setDirtyMoney', function(source, callback, money)
	local player = ESX.GetPlayerFromId(source)

	if player ~= nil then
		player.setMoney('black_money', money)
	end

	callback()
end)

ESX.RegisterServerCallback('esx_sommen_motel:addDirtyMoney', function(source, callback, money)
	local player = ESX.GetPlayerFromId(source)

	if player ~= nil then
		player.addAccountMoney('black_money', money)
	end

	callback()
end)

ESX.RegisterServerCallback('esx_sommen_motel:hasItem', function(source, callback, item, amount)
	local player = ESX.GetPlayerFromId(source)

	if player ~= nil then
		if player.getInventoryItem(item).count >= amount then
			callback(true)
		else
			callback(false)
		end
	end
end)

TriggerEvent('esx:getSharedObject', function(ESX)
	ESX.RegisterServerCallback('esx_sommen_motel:execute', function(source, callback, query, params)
		MySQL.Async.execute(tostring(query), params, function(result)
			callback(result)
		end)
	end)

	ESX.RegisterServerCallback('esx_sommen_motel:fetchAll', function(source, callback, query, params)
		MySQL.Async.fetchAll(tostring(query), params, function(result)
			callback(result)
		end)
	end)

	ESX.RegisterServerCallback('esx_sommen_motel:fetchScalar', function(source, callback, query, params)
		MySQL.Async.fetchScalar(tostring(query), params, function(result)
			callback(result)
		end)
	end)

	ESX.RegisterServerCallback('esx_sommen_motel:insert', function(source, callback, query, params)
		MySQL.Async.insert(tostring(query), params, function(result)
			callback(result)
		end)
	end)

	ESX.RegisterServerCallback('esx_sommen_motel:sync:execute', function(source, callback, query, params)
		callback(MySQL.Sync.execute(tostring(query), params))
	end)

	ESX.RegisterServerCallback('esx_sommen_motel:sync:fetchAll', function(source, callback, query, params)
		callback(MySQL.Sync.fetchAll(tostring(query), params))
	end)

	ESX.RegisterServerCallback('esx_sommen_motel:sync:fetchScalar', function(source, callback, query, params)
		callback(MySQL.Sync.fetchScalar(tostring(query), params))
	end)

	ESX.RegisterServerCallback('esx_sommen_motel:sync:insert', function(source, callback, query, params)
		callback(MySQL.Sync.insert(tostring(query), params))
	end)
end)