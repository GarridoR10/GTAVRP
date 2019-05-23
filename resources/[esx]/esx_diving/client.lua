ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

------------- Light Diving suit
RegisterNetEvent('esx_tenues:settenueplongee')
AddEventHandler('esx_tenues:settenueplongee', function()
	if UseTenu then

		TriggerEvent('skinchanger:getSkin', function(skin)

    		if skin.sex == 0 then
        		local clothesSkin = {
            		['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['ears_1'] = -1, ['ears_2'] = 0,
            		['torso_1'] = 15, ['torso_2'] = 0,
            		['decals_1'] = 0,  ['decals_2']= 0,
            		['mask_1'] = 36, ['mask_2'] = 0,
            		['arms'] = 15,
            		['pants_1'] = 16, ['pants_2'] = 0,
            		['shoes_1'] = 34, ['shoes_2'] = 0,
            		['helmet_1'] 	= 8, ['helmet_2'] = 0,
            		['bags_1'] = 43, ['bags_2'] = 0,
			['glasses_1'] = 6, ['glasses_2'] = 0,
			['chain_1'] = 0, ['chain_2'] = 0,
            		['bproof_1'] = 0,  ['bproof_2'] = 0
        		}
        		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    		else
        		local clothesSkin = {
            		['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['ears_1'] = -1, ['ears_2'] = 0,
            		['torso_1'] = 15, ['torso_2'] 	= 0,
            		['decals_1'] = 0,  ['decals_2'] = 0,
            		['mask_1'] = 36, ['mask_2'] 	= 0,
            		['arms'] = 15,
            		['pants_1'] = 15, ['pants_2'] 	= 0,
            		['shoes_1'] = 35, ['shoes_2'] 	= 0,
            		['helmet_1']= -1, ['helmet_2'] 	= 0,
            		['bags_1'] = 43, ['bags_2']	= 0,
			['glasses_1'] = 5, ['glasses_2'] = 0,
			['chain_1'] = 0, ['chain_2'] = 0,
            		['bproof_1'] = 0,  ['bproof_2'] = 0
        		}
        		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        	end
        	local playerPed = GetPlayerPed(-1)
			SetEnableScuba(GetPlayerPed(-1),true)
			SetPedMaxTimeUnderwater(GetPlayerPed(-1), 400.00)
    	end)
	else

		TriggerEvent('skinchanger:getSkin', function(skin)

			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

				if hasSkin then

					TriggerEvent('skinchanger:loadSkin', skin)
					TriggerEvent('esx:restoreLoadout')
				end
			end)
		end)
	end

	UseTenu  = not UseTenu
	GUI.Time = GetGameTimer()

end)

------------- Best Diving suit
RegisterNetEvent('esx_tenues:settenueplongee')
AddEventHandler('esx_tenues:settenueplongee', function()
	if UseTenu then

		TriggerEvent('skinchanger:getSkin', function(skin)

    		if skin.sex == 0 then
        		local clothesSkin = {
            		['tshirt_1'] 	= 15, ['tshirt_2'] = 0,
			['ears_1'] = -1, ['ears_2'] = 0,
            		['torso_1'] 	= 15, ['torso_2'] = 0,
            		['decals_1'] 	= 0,  ['decals_2'] = 0,
            		['mask_1'] 		= 36, ['mask_2'] = 0,
            		['arms'] 		= 15,
            		['pants_1'] 	= 16, ['pants_2'] = 0,
            		['shoes_1'] 	= 34, ['shoes_2'] = 0,
            		['helmet_1'] 	= 8, ['helmet_2'] = 0,
            		['bags_1']		= 43, ['bags_2'] = 0,
			['glasses_1'] = 6, ['glasses_2'] = 0,
			['chain_1'] = 0, ['chain_2'] = 0,
            		['bproof_1'] 	= 0,  ['bproof_2'] 	= 0
        		}
        		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    		else
        		local clothesSkin = {
            		['tshirt_1'] 	= 15, ['tshirt_2'] = 0,
			['ears_1'] = -1, ['ears_2'] = 0,
            		['torso_1'] = 15, ['torso_2'] = 0,
            		['decals_1'] = 0,  ['decals_2'] = 0,
            		['mask_1'] = 36, ['mask_2'] = 0,
            		['arms'] = 15,
            		['pants_1'] = 15, ['pants_2'] = 0,
            		['shoes_1'] = 35, ['shoes_2'] = 0,
            		['helmet_1'] = -1, ['helmet_2']	= 0,
            		['bags_1'] = 43, ['bags_2'] = 0,
			['glasses_1'] = 5, ['glasses_2'] = 0,
			['chain_1'] = 0, ['chain_2'] = 0,
            		['bproof_1'] = 0,  ['bproof_2'] = 0
        		}
        		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        	end
        	local playerPed = GetPlayerPed(-1)
			SetEnableScuba(GetPlayerPed(-1),true)
			SetPedMaxTimeUnderwater(GetPlayerPed(-1), 1500.00)
    	end)
	else

		TriggerEvent('skinchanger:getSkin', function(skin)

			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

				if hasSkin then

					TriggerEvent('skinchanger:loadSkin', skin)
					TriggerEvent('esx:restoreLoadout')
				end
			end)
		end)
	end

	UseTenu  = not UseTenu
	GUI.Time = GetGameTimer()

end)
