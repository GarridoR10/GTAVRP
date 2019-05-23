# esx_coffee

[REQUIREMENT]

esx_basicneeds =>  ``https://github.com/ESX-Org/esx_basicneeds``

[INSTALLATION]

1) CD in your resources/[esx] folder
2) Clone the repository
``git clone https://github.com/Thananyx/esx_coffee.git``


3) Import ``esx_coffees.sql`` in your database


4) Add this in your server.cfg :

``start esx_coffee``


5) UPDATE .SQL
```
INSERT INTO `items` (name, label) VALUES 
	('coffee', 'Café')
;
```


6) UPDATE esx_basicneeds [server/main.lua]
```
ESX.RegisterUsableItem('coffee', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('coffee', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onDrinkCoffee', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_coffee'))

end)
```


7) UPDATE esx_basicneeds [client/main.lua]
```
RegisterNetEvent('esx_basicneeds:onDrinkCoffee')
AddEventHandler('esx_basicneeds:onDrinkCoffee', function(prop_name)
	if not IsAnimated then
		local prop_name = prop_name or 'p_amb_coffeecup_01'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)			
	        AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Wait(0)
			end
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)
			Wait(3000)
	        IsAnimated = false
	        ClearPedSecondaryTask(playerPed)
			DeleteObject(prop)
		end)
	end
end)
```


8) UPDATE esx_basicneeds [locales/yourlanguage.lua]
```['used_coffee'] = 'vous avez bu un café'```