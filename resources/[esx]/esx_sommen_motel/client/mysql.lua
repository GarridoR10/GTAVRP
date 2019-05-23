MySQL = {
	Sync = {}
}

function MySQL.execute(query, params, func)
	if func == nil then
		func = function()
		end
	end

	ESX.TriggerServerCallback('esx_sommen_motel:execute', func, query, params)
end

function MySQL.fetchAll(query, params, func)
	if func == nil then
		func = function()
		end
	end

	ESX.TriggerServerCallback('esx_sommen_motel:fetchAll', func, query, params)
end

function MySQL.fetchScalar(query, params, func)
	if func == nil then
		func = function()
		end
	end

	ESX.TriggerServerCallback('esx_sommen_motel:fetchScalar', func, query, params)
end

function MySQL.insert(query, params, func)
	if func == nil then
		func = function()
		end
	end

	ESX.TriggerServerCallback('esx_sommen_motel:insert', func, query, params)
end

function MySQL.Sync.execute(query, params, func)
	if func == nil then
		func = function()
		end
	end

	ESX.TriggerServerCallback('esx_sommen_motel:sync:execute', func, query, params)
end

function MySQL.Sync.fetchAll(query, params, func)
	if func == nil then
		func = function()
		end
	end

	ESX.TriggerServerCallback('esx_sommen_motel:sync:fetchAll', func, query, params)
end

function MySQL.Sync.fetchScalar(query, params, func)
	if func == nil then
		func = function()
		end
	end

	ESX.TriggerServerCallback('esx_sommen_motel:sync:fetchScalar', func, query, params)
end

function MySQL.Sync.insert(query, params, func)
	if func == nil then
		func = function()
		end
	end

	ESX.TriggerServerCallback('esx_sommen_motel:sync:insert', func, query, params)
end