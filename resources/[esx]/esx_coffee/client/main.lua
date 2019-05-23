ESX                           = nil
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('onClientMapStart', function()

	ESX.TriggerServerCallback('esx_coffee:requestDBItems', function(CoffeeItems)
		for k,v in pairs(CoffeeItems) do
			Config.Zones[k].Items = v
		end
	end)

end)

function OpenCoffeeMenu(zone)

	local elements = {}

	for i=1, #Config.Zones[zone].Items, 1 do

		local item = Config.Zones[zone].Items[i]

		table.insert(elements, {
			label     = item.label .. ' - $' .. item.price .. ' ',
			realLabel = item.label,
			value     = item.name,
			price     = item.price
		})

	end


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'coffee',
		{
			title  = _U('coffee'),
			elements = elements
		},
		function(data, menu)
			TriggerServerEvent('esx_coffee:buyItem', data.current.value, data.current.price)
		end,
		function(data, menu)

			menu.close()

			CurrentAction     = 'coffee_menu'
			CurrentActionMsg  = _U('press_menu')
			CurrentActionData = {zone = zone}
		end
	)
end

AddEventHandler('esx_coffee:hasEnteredMarker', function(zone)

	CurrentAction     = 'coffee_menu'
	CurrentActionMsg  = _U('press_menu')
	CurrentActionData = {zone = zone}

end)

AddEventHandler('esx_coffee:hasExitedMarker', function(zone)

	CurrentAction = nil
	ESX.UI.Menu.CloseAll()

end)

-- Create Blips
--Citizen.CreateThread(function()
	--for k,v in pairs(Config.Zones) do
  	--for i = 1, #v.Pos, 1 do
		--local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
		--SetBlipSprite (blip, 52)
		--SetBlipDisplay(blip, 4)
		--SetBlipScale  (blip, 1.0)
		--SetBlipColour (blip, 2)
		--SetBlipAsShortRange(blip, true)
		--BeginTextCommandSetBlipName("STRING")
		--AddTextComponentString(_U('coffees'))
		--EndTextCommandSetBlipName(blip)
		--end
	--end
--end)

-- Display markers
Citizen.CreateThread(function()
  while true do
    Wait(0)
    local coords = GetEntityCoords(GetPlayerPed(-1))
    for k,v in pairs(Config.Zones) do
      for i = 1, #v.Pos, 1 do
        if(Config.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < Config.DrawDistance) then
          DrawMarker(Config.Type, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
        end
      end
    end
  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Pos, 1 do
				if(GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < Config.Size.x) then
					isInMarker  = true
					CoffeeItems   = v.Items
					currentZone = k
					LastZone    = k
				end
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_coffee:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_coffee:hasExitedMarker', LastZone)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlJustReleased(0, 38) then

        if CurrentAction == 'coffee_menu' then
          OpenCoffeeMenu(CurrentActionData.zone)
        end

        CurrentAction = nil

      end

    end
  end
end)
