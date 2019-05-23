-----------------------------------
--        Credit for Kalu / Kashnars      --
-----------------------------------
ESX               = nil

----CONFIG----

--END CONFIG--

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getBlackMoneyFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('black_money')
	return account.money

end

local function getBankFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('bank')
	return account.money

end

-- local function getSocietyBank(societyName)
-- 		--print(societyName)
-- 	local mySociety = nil
-- 	TriggerEvent('esx_society:getSociety', societyName, function(society)
-- 		mySociety = society
-- 	end)
-- 	--print(json.encode(mySociety))
--   	if mySociety ~= nil then

--     	TriggerEvent('esx_addonaccount:getSharedAccount', mySociety.account, function(account)
--       	print(account.money)
--       		return account.money
--     	end)
--   	end

--   	return nil
-- end

RegisterServerEvent('allcity_wallet:getMoneys')
AddEventHandler('allcity_wallet:getMoneys', function()

	local _source = source

	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer ~= nil then
		local wallet 		= getMoneyFromUser(_source)
		local bank 			= getBankFromUser(_source)
		local black_money 	= getBlackMoneyFromUser(_source)

		local society 		= nil

		local user_identifier = nil
		user_identifier = xPlayer.getIdentifier()

		local grade_name 	= xPlayer.job.grade_name
		local job_name 		= xPlayer.job.name

		if grade_name == 'boss' then
	 		local mySociety = nil
			TriggerEvent('esx_society:getSociety', job_name, function(_society)
				mySociety = _society
			end)

	  		if mySociety ~= nil then

		    	TriggerEvent('esx_addonaccount:getSharedAccount', mySociety.account, function(account)
		      		society = account.money
		    	end)
		  	end
		end

		
		-- MySQL.Async.fetchAll(
	 --        'SELECT job_grades.name, job_grades.job_name FROM job_grades JOIN users ON users.job = job_grades.job_name AND users.job_grade = job_grades.grade WHERE users.identifier = @identifier',
	 --        {['@identifier'] = user_identifier},
	 --        function(result)
	 --        	if result[1].name == 'boss' then
	 --        		society = getSocietyBank(result[1].job_name)
	 --        	end
	 --        end)	

	    TriggerClientEvent("allcity_wallet:setValues", _source, wallet, bank, black_money, society)
	end

end)




