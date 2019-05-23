--[[Written by Monty Piper for Compton RP
	Join our discord http://discord.gg/ERYZtea
	commands are /hat /sg /gloves /mask /hood
	Any question, comments, or concerns contact
	me via discord :)                      ]]--

--Puts hat on
TriggerEvent('es:addCommand', 'hat', function(source, args, user)
	TriggerClientEvent('haton', source, {})
end, {help = "Put on your hat"})

--Sunglasses on
TriggerEvent('es:addCommand', 'sg', function(source, args, user)
	TriggerClientEvent('sung', source, {})
end, {help = "Put on your sunglasses"})

--Puts mask on
TriggerEvent('es:addCommand', 'mask', function(source, args, user)
	TriggerClientEvent('maskon', source, {})
end, {help = "Put on your mask on"})

--Gloves on
TriggerEvent('es:addCommand', 'gloves', function(source, args, user)
	TriggerClientEvent('gloveson', source, {})
end, {help = "Put on your gloves"})

--Opens Hood of car
TriggerEvent('es:addCommand', 'hood', function(source, args, user)
	TriggerClientEvent('hood', source, {})
end, {help = "Open the hood of your car"})