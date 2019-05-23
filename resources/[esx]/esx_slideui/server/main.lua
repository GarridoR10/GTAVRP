ESX = nil
local RegisteredSocieties = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('es:addCommand', 'cash', function(source)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local money = xPlayer.get('money')
	
	TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
	TriggerClientEvent("pNotify:SendNotification", source, {
		text = "You have $".. money .." on hand!",
		type = "success",
		progressBar = false,
		queue = "lmao",
		timeout = 4000,
		layout = "CenterLeft"
	})
end, {help = "Check your wallet"})

TriggerEvent('es:addCommand', 'balance', function(source)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local money = xPlayer.getAccount('bank').money
	
	TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
	TriggerClientEvent("pNotify:SendNotification", source, {
		text = "You have $".. money .." in bank!",
		type = "success",
		progressBar = false,
		queue = "lmao",
		timeout = 4000,
		layout = "CenterLeft"
	})
end, {help = "Check your bank balance"})

TriggerEvent('es:addCommand', 'dirty', function(source)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local money = xPlayer.getAccount('black_money').money
	
	TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
	TriggerClientEvent("pNotify:SendNotification", source, {
		text = "You have $".. money .." in dirty money!",
		type = "success",
		progressBar = false,
		queue = "lmao",
		timeout = 4000,
		layout = "CenterLeft"
	})
end, {help = "Check your dirty money"})

TriggerEvent('es:addCommand', 'job', function(source)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local job = xPlayer.job.label
	local jobgrade = xPlayer.job.grade_label
	
	TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
	TriggerClientEvent("pNotify:SendNotification", source, {
		text = "You are working as ".. job .." and your grade is ".. jobgrade .."!",
		type = "success",
		progressBar = false,
		queue = "lmao",
		timeout = 4000,
		layout = "CenterLeft"
	})
end, {help = "Check your job"})

TriggerEvent('es:addCommand', 'societybalance', function(source)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.job.grade_name == 'boss' then
		local society = GetSociety(xPlayer.job.name)

		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
		end
		
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "You have $".. money .." in the society account!",
			type = "success",
			progressBar = false,
			queue = "lmao",
			timeout = 4000,
			layout = "CenterLeft"
		})
	else
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "You don't have access to the society account!",
			type = "success",
			progressBar = false,
			queue = "lmao",
			timeout = 4000,
			layout = "CenterLeft"
		})
	end
end, {help = "Check your society's balance"})

TriggerEvent('esx_society:getSocieties', function(societies) 
	RegisteredSocieties = societies
end)

function GetSociety(name)
  for i=1, #RegisteredSocieties, 1 do
    if RegisteredSocieties[i].name == name then
      return RegisteredSocieties[i]
    end
  end
end