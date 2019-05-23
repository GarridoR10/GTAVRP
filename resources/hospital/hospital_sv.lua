RegisterServerEvent('hospital:price')
AddEventHandler('hospital:price', function()
  	local price = 150
	TriggerEvent('es:getPlayerFromId', source, function(user)
  	user:removeMoney((price))
 	end)
end)
