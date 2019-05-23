local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local CachedApartments = {}
local Apartments = {
	[1] = {
		label = 'Motel',
		ipl = 'Motel',
		enter = {x = 312.86, y = -218.87, z = 57.02},
		inside = {x = 151.38, y = -1007.95, z = -99.0},
		exit = {x = 151.38, y = -1007.95, z = -100.0},
		closet = {x = 151.8, y = -1001.36, z = -100.0},
		storage = {x = 151.33, y = -1003.08, z = -100.0}
	}
}	
local PlayerData                = {}
local GUI                       = {}
local playerId = PlayerId()
local serverId = GetPlayerServerId(localPlayerId)
local cam = nil
local hidden = {}
local drugs = {
	"weed_pooch",
	"coke_pooch",
	"meth_pooch",
	"weed_seed",
	"marijuana",
	"coke_ingredients",
	"meth_ingredients"
}

ESX = nil
Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj
		end)
		
		Citizen.Wait(0)
	end

	while not ESX.IsPlayerLoaded() do
		Citizen.Wait(100)
	end

	CacheApartments(function()
		for k,v in pairs(Apartments) do
			local owns = HasApartment(k)
			local owned = not visit and not invite
			local ped = GetPlayerPed(-1)			
			local enterMessage = 'Press ~INPUT_CONTEXT~ to enter your room'

			if not owns then
				enterMessage = 'Press ~INPUT_CONTEXT~ to enter your room'
			end

			Markers.AddMarker('apartment_' .. k, v.enter, enterMessage, function()
				OpenApartmentMenu(k, owns)
			end)		

			if owned or visit then
				Session('create', {type = 'apartment', id = apartment})
			end

			if owned then
				Markers.RemoveMarker('apartment_storage' .. k)
				Markers.AddMarker('apartment_storage', v.storage, 'Press ~INPUT_CONTEXT~ to open Inventory', function()
					OpenStorageMainMenu(k, owns)
				end)
			end

			if owned or invited then
				Markers.RemoveMarker('apartment_closet' .. k)
				Markers.AddMarker('apartment_closet', v.closet, 'Press ~INPUT_CONTEXT~ to change Clothes', function()
				    ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)
			            local elements = {}

					    for i=1, #dressing, 1 do
					        table.insert(elements, {label = dressing[i], value = i})
					    end

				        ESX.UI.Menu.Open(
				            'default', GetCurrentResourceName(), 'player_dressing',
				            {
				                title = 'Your Clothes',
				                align = 'top-left',
				                elements = elements,
				            },
				            function(data, menu)
			                TriggerEvent('skinchanger:getSkin', function(skin)
			                    ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerOutfit', function(clothes)
			                        TriggerEvent('skinchanger:loadClothes', skin, clothes)
			                        TriggerEvent('esx_skin:setLastSkin', skin)

			                        TriggerEvent('skinchanger:getSkin', function(skin)
			                            TriggerServerEvent('esx_skin:save', skin)
					                end)
			               		end, data.current.value)
			             	end)
				            end,
				            function(data, menu)
				                menu.close()
				            end
				        )
				    end)
				end)
			end		

            Markers.RemoveMarker('apartment_exit' .. k)
		    Markers.AddMarker('apartment_exit', v.exit, 'Press ~INPUT_CONTEXT~ to open room Menu', function()
				local elements = {
					{label = 'Leave room', value = 'exit'}
				}

				if owned or invite then
					table.insert(elements, {label = 'Invite a friend', value = 'invite'})
				end

				ESX.UI.Menu.CloseAll()
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'apartment_teleport_menu',
					{
						title = 'Entrance',
						align = 'top-left',
						elements = elements
					},
					function(data, menu)
						menu.close()

						if data.current.value == 'exit' then

							SetEntityCoords(GetPlayerPed(-1), 312.86, -218.87, 57.02)

							if owned or visit then
								Session('delete')
							else
								Session('leave')
							end
							
						elseif data.current.value == 'invite' then
							local playersInArea = ESX.Game.GetPlayersInArea(v.enter, 10.0)
					        local elements = {}

					        for i=1, #playersInArea, 1 do
					            if playersInArea[i] ~= PlayerId() then
					                table.insert(elements, {label = GetPlayerName(playersInArea[i]), value = playersInArea[i]})
					            end
					        end

					        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'apartments_invite',
					            {
					                title = 'Invite a friend',
					                align = 'top-left',
					                elements = elements,
					            },
					            function(data, menu)
					            	menu.close()

					            	Session('invite', GetPlayerServerId(data.current.value), apartment)
					            end,
					            function(data, menu)
					                menu.close()
					            end
					        )
						end
					end,
					function(data, menu)
						menu.close()
					end
				)
			end)
			if v.enter ~= nil then
				local coords = v.enter
				local blip = AddBlipForCoord(coords.x, coords.y, coords.z)

				SetBlipSprite(blip, 475)
				SetBlipDisplay(blip, 4)
				SetBlipColour(blip, 67)
				SetBlipAsShortRange(blip, true)

			    BeginTextCommandSetBlipName("STRING")
			    AddTextComponentString('Motel')
	    		EndTextCommandSetBlipName(blip)
			end
		end

		TriggerServerEvent('esx_sommen_motel:playerLoaded', GetPlayerServerId(PlayerId()))
	end)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		for i=1, #hidden, 1 do
			local ped = GetPlayerPed(hidden[i])

			SetEntityLocallyInvisible(ped)
			SetEntityNoCollisionEntity(GetPlayerPed(-1), ped, true)
		end
	end
end)

function Session(data, ...)
	TriggerServerEvent('esx_sommen_motel:session:' .. data, GetPlayerServerId(PlayerId()), ...)
end

RegisterNetEvent('esx_sommen_motel:voiceChannel')
AddEventHandler('esx_sommen_motel:voiceChannel', function(channel)
	if channel ~= nil then
		NetworkSetVoiceChannel(channel)
	else	
		Citizen.InvokeNative(0xE036A705F989E049)
	end
end)

RegisterNetEvent('esx_sommen_motel:show')
AddEventHandler('esx_sommen_motel:show', function(id)
	for i=1, #ESX.Game.GetPlayers(), 1 do
		if GetPlayerServerId(ESX.Game.GetPlayers()[i]) == id then
			for i=1, #hidden, 1 do
				if GetPlayerServerId(hidden[i]) == id then
					table.remove(hidden, i)
			 	end 
			end
		end
	end
end)

RegisterNetEvent('esx_sommen_motel:leave')
AddEventHandler('esx_sommen_motel:leave', function(session)
	if session.data ~= nil then
		if session.data.type == 'apartment' then
			local apartment = session.data.id
			local values = GetApartmentValues(apartment)

			SetEntityCoords(GetPlayerPed(-1), 312.86, -218.87, 57.02)

		else
		end
	end
end)

RegisterNetEvent('esx_sommen_motel:joinedSession')
AddEventHandler('esx_sommen_motel:joinedSession', function(session, identifier)
	if session.data ~= nil then
		if session.data.type == 'apartment' then

			SetEntityCoords(GetPlayerPed(-1), 151.38, -1007.95, -99.0 - 1.0)

		end
	end
end)

RegisterNetEvent('esx_sommen_motel:hide')
AddEventHandler('esx_sommen_motel:hide', function(id)
	for i=1, #ESX.Game.GetPlayers(), 1 do
		if GetPlayerServerId(ESX.Game.GetPlayers()[i]) == id then
			local ped = GetPlayerPed(ESX.Game.GetPlayers()[i])

			table.insert(hidden, ESX.Game.GetPlayers()[i])
		end
	end
end)

RegisterNetEvent('esx_sommen_motel:gotInvite')
AddEventHandler('esx_sommen_motel:gotInvite', function(inviter, apartment)
	OpenConfirmationMenu(function(confirmed)
		if confirmed then
			Session('acceptInvite', inviter)

			SetEntityCoords(GetPlayerPed(-1), 151.38, -1007.95, -99.0 - 1.0)

		end
	end)
end)

function OpenStorageMainMenu(apartment)
	local elements = {
		{label = 'Items', value = 'items'},
		{label = 'Dirty Money', value = 'safe'},
		{label = 'Drugs', value = 'drugs'}
	}

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'apartment_storage',
		{
			title = 'Inventory',
			align = 'top-left',
			elements = elements
		},
		function(data, menu)
			menu.close()

			OpenStorageUnit(apartment, data.current.value)	
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenStorageUnit(apartment, storage)
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'apartment_storage_option',
		{
			title = 'Inventory',
			align = 'top-left',
			elements = {
				{label = 'Get items', value = 'get'},
				{label = 'Store items', value = 'put'}
			}
		},
		function(data, menu)
			menu.close()

			OpenStorageUnitContent(apartment, storage, data.current.value == 'get')
		end,
		function(data, menu)
			menu.close()

			OpenStorageMainMenu(apartment)
		end
	)
end

function OpenStorageUnitContent(apartment, storage, get)
	MySQL.fetchAll('SELECT items FROM motel WHERE identifier=@identifier AND id=@id',
		{
			["@identifier"] = ESX.GetPlayerData().identifier,
			["@id"] = apartment
		},
		function(fetched)
			if fetched ~= nil and fetched[1] ~= nil then
				local items = json.decode(fetched[1].items)

				if get then
					if items[storage] ~= nil then
						local elements = {}

						for k,v in pairs(items[storage]) do
							if v ~= nil and v.count ~= nil then
								if v.count > 0 then
									if v.money == true then
										table.insert(elements, {label = 'Dirty Money (' .. v.count .. ' $)', value = k, amount = v.count, rawLabel = 'Dirty Money'})								
									else
										table.insert(elements, {label = v.label .. ' x' .. v.count, value = k, amount = v.count, rawLabel = v.label})
									end
								end
							end
						end

						ESX.UI.Menu.CloseAll()
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'apartment_storage_items',
							{
								title = 'Inventory',
								align = 'top-left',
								elements = elements
							},
							function(data2, menu)
								menu.close()

				        		local itemName = data2.current.value

				        		OpenQuantityMenu(function(count)
				        			if count <= 0 then
				        				ESX.ShowNotification('~r~Invalid amound. Needs to be higher than 0.')
				        				
				        				return
				        			end

				        			if items[storage] ~= nil and items[storage][itemName] ~= nil then	    
				        				if items[storage][itemName].weapon ~= true then
					        				if items[storage][itemName].count >= count then
						        				items[storage][itemName].count = items[storage][itemName].count - count

						        				if items[storage][itemName].money == true then
						        					ESX.TriggerServerCallback('esx_sommen_motel:addDirtyMoney', function()
										        	end, count)
						        				else
								        			ESX.TriggerServerCallback('esx_sommen_motel:addItem', function()
										        	end, itemName, count)
								        		end

												if items[storage][itemName].count < 1 then
								        			items[storage][itemName] = nil
								        		end

						        				MySQL.Sync.execute('UPDATE motel SET items=@items WHERE identifier=@identifier AND id=@id',
							        				{
							        					["@items"] = json.encode(items),
							        					["@identifier"] = ESX.GetPlayerData().identifier,
							        					["@id"] = apartment
							        				}
						        				)
							        		else
							        			ESX.ShowNotification('Inventory does not contains ~r~x' .. count .. ' ' .. data2.current.rawLabel)
							        		end
							        	end
				        			else
				        				ESX.ShowNotification('Inventory does not contain ~r~x' .. count .. ' ' .. data2.current.rawLabel)
				        			end						     

								    OpenStorageUnitContent(apartment, storage, get)   		
				        		end)
							end,
							function(data, menu)
								menu.close()

								OpenStorageUnit(apartment, storage)
							end
						)
					end
				else
					ESX.TriggerServerCallback('esx_sommen_motel:getInventory', function(inventory)
				    	ESX.TriggerServerCallback('esx_sommen_motel:getDirtyMoney', function(money)
					    	local elements = {}

					    	if storage == 'safe' then
					    		table.insert(elements, {label = 'Dirty money (' .. money .. ' $)', value = 'dirty', amount = money, money = true})	
					    	else
						    	for i=1, #inventory, 1 do
						      		local item = inventory[i]

						      		if item.count > 0 then
						      			if storage == 'drugs' then
						      				if table.contains(drugs, string.lower(item.name)) then
								        		table.insert(elements, {label = item.label .. ' x' .. item.count, value = item.name, rawLabel = item.label})
								        	end		
							        	else
							        		if (not table.contains(drugs, string.lower(item.name)) and (not string.startsWith(string.lower(item.name), 'weapon_'))) then
								        		table.insert(elements, {label = item.label .. ' x' .. item.count, value = item.name, rawLabel = item.label})
								        	end
							        	end
						     	 	end
						    	end
						    end

					    	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'apartment_put_stash',
					      		{
					        		title = 'Inventory',
					        		align = 'top-left',
					        		elements = elements
					      		},
					     		function(data2, menu)
					     			menu.close()

					        		local itemName = data2.current.value

					        		if data2.current.money == true then
					        			OpenQuantityMenu(function(count)
					        				if count <= 0 then
						        				ESX.ShowNotification('~r~Invalid amount. Needs to be higher than 0.')

						        				return
						        			end

					        				if money >= count then
					        					if items[storage] ~= nil and items[storage][itemName] ~= nil then
							        				items[storage][itemName].count = items[storage][itemName].count + count
							        			else
							        				if items[storage] == nil then
							        					items[storage] = {}
							        				end

							        				items[storage][itemName] = {count = count, label = 'Dirty money', money = true}
							        			end

							        			MySQL.Sync.execute('UPDATE motel SET items=@items WHERE identifier=@identifier AND id=@id',
							        				{
							        					["@items"] = json.encode(items),
							        					["@identifier"] = ESX.GetPlayerData().identifier,
							        					["@id"] = apartment
							        				}
							        			)

							        			ESX.TriggerServerCallback('esx_sommen_motel:setDirtyMoney', function()
							        			end, (money - count))
					        				else
					        					ESX.ShowNotification("You have ~r~none~w~ ~r~" .. count .. " $ ~w~Black money.")
					        				end
					        			end)
					        		elseif data2.current.weapon ~= true then
						        		OpenQuantityMenu(function(count)
						        			if count <= 0 then
						        				ESX.ShowNotification('~r~Invalid amount. Needs to be higher than 0.')

						        				return
						        			end

						        			ESX.TriggerServerCallback('esx_sommen_motel:hasItem', function(has)
						        				if has == true then
						        					if items[storage] ~= nil and items[storage][itemName] ~= nil then
								        				items[storage][itemName].count = items[storage][itemName].count + count
								        			else
								        				if items[storage] == nil then
								        					items[storage] = {}
								        				end

								        				items[storage][itemName] = {count = count, label = data2.current.rawLabel}
								        			end

								        			MySQL.Sync.execute('UPDATE motel SET items=@items WHERE identifier=@identifier AND id=@id',
								        				{
								        					["@items"] = json.encode(items),
								        					["@identifier"] = ESX.GetPlayerData().identifier,
								        					["@id"] = apartment
								        				}
								        			)

								        			ESX.TriggerServerCallback('esx_sommen_motel:removeItem', function()
								        			end, itemName, count)
						        				else
						        					ESX.ShowNotification("You dont ~r~have ~w~this ~w~amount")
						        				end
						        			end, itemName, count)

										    OpenStorageUnitContent(apartment, storage, get)				       
						        		end)
					        		end
					          	end,
					         	function(data, menu)
					            	menu.close()

									OpenStorageUnit(apartment, storage)
					     		end
					    	)
					  	end)
					end)
				end
			end
		end
	)
end

function OpenApartmentMenu(apartment, owned)
	local values = GetApartmentValues(apartment)

		if owned then

			SetEntityCoords(GetPlayerPed(-1), 151.38, -1007.95, -99.0 - 1.0)

		else
			CachedApartments[apartment] = {
				owned = true,
				items = '[]'
			}

			MySQL.execute('INSERT INTO motel (id, identifier, items) VALUES (@id, @identifier, @items)', 
				{
					["@id"] = apartment,
					["@identifier"] = ESX.GetPlayerData().identifier,
					["@items"] = '[]',		
				}
			)

			Markers.AddMarker('apartment_' .. apartment, values.enter, 'Press ~INPUT_CONTEXT~ to enter your room', function()
				OpenApartmentMenu(apartment, true)
			end)	

			SetEntityCoords(GetPlayerPed(-1), 151.38, -1007.95, -99.0 - 1.0)

			Notifications.PlaySpecialNotification("Welcome to your motel room")				

		end					    	
end

function OpenConfirmationMenu(callback)
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'confirmation_menu',
		{
			title = 'Are you sure?',
			align = 'top-left',
			elements = {
				{label = 'Yes', value = 'yes'},
				{label = 'No', value = 'no'}
			}
		},
		function(data, menu)
			menu.close()

			callback(data.current.value == 'yes')
		end,
		function(data, menu)
			menu.close()

			callback()
		end
	)
end

function OpenQuantityMenu(callback)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'quantity_menu',
        {
            title = 'Quantity'
        },
        function(data, menu)
            local count = tonumber(data.value)

            if count == nil then
              	ESX.ShowNotification('Quantity invalid')
            else
              	menu.close()
            
              	callback(count)
            end
        end,
        function(data, menu)
        	menu.close()
        end
    )
end

function HasApartment(apartment)
	return CachedApartments[apartment].owned
end

function GetApartmentValues(apartment)
	for k,v in pairs(Apartments) do
		if k == apartment then
			return v
		end
	end
end

function CacheApartments(callback)
	local identifier = ESX.GetPlayerData().identifier

	MySQL.fetchAll('SELECT * FROM motel WHERE identifier = @identifier', 
	{
		["@identifier"] = identifier,
	}, 
	function(fetched)
		if fetched ~= nil then
			for i=1, #fetched, 1 do
				local row = fetched[i]

				CachedApartments[row.id] = {owned = true}
			end

			callback()
		end
	end)

	for k,v in pairs(Apartments) do
		if CachedApartments[k] == nil then
			CachedApartments[k] = {owned = false}
		end
	end
end

-----------------------FUN SHIT-----------------------------------

local InAction = false

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(5)

            local ped = GetPlayerPed(-1)

            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 154.2, -1006.01, -99.0, true)

            if distance < 3 and InAction == false then
                Drawing.draw3DText(154.2, -1006.01, -101.0, 'Press ~g~[E] ~w~to lay down in bed', 6, 0.07, 0.07, 255, 255, 255, 215)
              if distance < 1 and InAction == false then
                if IsControlJustReleased(0, Keys['E']) then
                    bedActive(154.51, -1004.48, -98.42, 86.83)
                end
              end  
            end
    end
end)

function bedActive(x, y, z, heading)

    SetEntityCoords(GetPlayerPed(-1), x, y, z)
    RequestAnimDict('anim@gangops@morgue@table@')
    while not HasAnimDictLoaded('anim@gangops@morgue@table@') do
        Citizen.Wait(0)
    end
    TaskPlayAnim(GetPlayerPed(-1), 'anim@gangops@morgue@table@' , 'ko_front' ,8.0, -8.0, -1, 1, 0, false, false, false )
    SetEntityHeading(GetPlayerPed(-1), heading)
    InAction = true


    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)

            if InAction == true then
                headsUp('Press ~INPUT_VEH_DUCK~ to stand up')
                if IsControlJustReleased(0, Keys['X']) then
                    ClearPedTasks(GetPlayerPed(-1))
                    FreezeEntityPosition(GetPlayerPed(-1), false)
                    SetEntityCoords(GetPlayerPed(-1), 152.89, -1004.65, -99.0)
                    InAction = false
                end
            end
        end
    end)
end

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(5)

            local ped = GetPlayerPed(-1)

            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 154.64, -1001.16, -99.0, true)

            if distance < 2.3 and InAction == false then
                Drawing.draw3DText(154.64, -1001.16, -101.0, 'Press ~g~[E] ~w~to use the toilet', 6, 0.07, 0.07, 255, 255, 255, 215)
              if distance < 1 and InAction == false then
                if IsControlJustReleased(0, Keys['E']) then
                    toa(155.03, -1001.09, -98.34, 92.43)
                end
              end  
            end
    end
end)

function toa(x, y, z, heading)

    SetEntityCoords(GetPlayerPed(-1), x, y, z)
    SetEntityHeading(GetPlayerPed(-1), heading)
    InAction = true    
    local Player = ped
    local PlayerPed = GetPlayerPed(GetPlayerFromServerId(ped))

    local particleDictionary = "scr_amb_chop"
    local particleName = "ent_anim_dog_poo"
    local animDictionary = 'missfbi3ig_0'
    local animName = 'shit_loop_trev'

    RequestNamedPtfxAsset(particleDictionary)

    while not HasNamedPtfxAssetLoaded(particleDictionary) do
        Citizen.Wait(0)
    end

    RequestAnimDict(animDictionary)

    while not HasAnimDictLoaded(animDictionary) do
        Citizen.Wait(0)
    end

    SetPtfxAssetNextCall(particleDictionary)

    --gets bone on specified ped
    bone = GetPedBoneIndex(PlayerPed, 11816)

    --animation
    TaskPlayAnim(PlayerPed, animDictionary, animName, 8.0, -8.0, -1, 0, 0, false, false, false)

    --2 effets for more shit
    effect = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.6, 0.0, 0.0, 20.0, bone, 2.0, false, false, false)
    Wait(3500)
    effect2 = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.6, 0.0, 0.0, 20.0, bone, 2.0, false, false, false)
    Wait(1000)

    StopParticleFxLooped(effect, 0)
    Wait(10)
    StopParticleFxLooped(effect2, 0)
    ClearPedTasks(GetPlayerPed(-1))
    FreezeEntityPosition(GetPlayerPed(-1), false)
    SetEntityCoords(GetPlayerPed(-1), 154.64, -1001.16, -100.0)
    InAction = false    
end

function headsUp(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end



function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY,r, g, b, a)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(r, g, b, a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

-- Simon T "Sommen" (translated by Firsty)
