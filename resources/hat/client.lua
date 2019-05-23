
--[ Written By Monty Piper ]--

local hwaycop = GetHashKey("s_m_y_hwaycop_01")
local cop = GetHashKey("s_m_y_cop_01")
local sheriff = GetHashKey("s_m_y_sheriff_01")
local pilot = GetHashKey("s_m_m_pilot_02")
local fireman = GetHashKey("s_m_y_fireman_01")
local medic = GetHashKey("s_m_m_paramedic_01")
local fsheriff = GetHashKey("s_f_y_sheriff_01")
local fcop = GetHashKey("s_f_y_cop_01")
local ranger = GetHashKey("s_m_y_ranger_01")
local swat = GetHashKey("s_m_y_swat_01")
local traffic = GetHashKey("csb_trafficwarden")
local uscg = GetHashKey("s_m_y_uscg_01")
local blackops = GetHashKey("s_m_y_blackops_01")
local fsheriff2 = GetHashKey("s_f_y_sheriff_02")
local dick = GetHashKey("s_m_m_dick_02")
local fbiswat = GetHashKey("s_m_y_fibswat_01")
local seb = GetHashKey("s_m_y_seb_01")
local seb2 = GetHashKey("s_m_y_seb_02")
local sheriff2 = GetHashKey("s_m_y_sheriff_02")
local doa = GetHashKey("u_m_m_doa_01")


hat = false

  RegisterNetEvent( 'haton' )
AddEventHandler( 'haton', function()
	hat = not hat
	if(GetEntityModel(GetPlayerPed(-1)) == hwaycop) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 01, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == cop) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif(GetEntityModel(GetPlayerPed(-1)) == sheriff) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == pilot) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == fireman) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == medic) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == fsheriff) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == fcop) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == ranger) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == swat) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == traffic) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == uscg) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == blackops) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == dick) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == fbiswat) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == seb) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == seb2) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == sheriff2) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == doa) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == fsheriff2) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	end
end)

mask = false

  RegisterNetEvent( 'maskon' )
AddEventHandler( 'maskon', function()
	if (GetEntityModel(GetPlayerPed(-1)) == fireman) then
		mask = not mask	
		if mask then
			SetPedComponentVariation(GetPlayerPed(-1), 8, 1, 1, 1)
		else
			SetPedDefaultComponentVariation(GetPlayerPed(-1))
		end		
	end
end)

gloves = false

  RegisterNetEvent( 'gloveson')
AddEventHandler( 'gloveson', function()
	if (GetEntityModel(GetPlayerPed(-1)) == medic) then
		gloves = not gloves
		if gloves then
			SetPedComponentVariation(GetPlayerPed(-1), 5, 1, 0, 1)
		else 
			SetPedDefaultComponentVariation(GetPlayerPed(-1))
		end
	end
end)

sg = false

  RegisterNetEvent( 'sung' )
AddEventHandler( 'sung', function()
	sg = not sg
	if(GetEntityModel(GetPlayerPed(-1)) == hwaycop) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 1, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == cop) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == sheriff) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 1, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == pilot) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == medic) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == fireman) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == fsheriff) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == fcop) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == ranger) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == swat) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == traffic) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == uscg) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == blackops) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == fsheriff2) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == dick) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == fbiswat) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == seb) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == seb2) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == sheriff2) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == doa) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	end
end)

hood = false

  RegisterNetEvent( 'hood' )
AddEventHandler( 'hood', function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
	hood = not hood
		if hood then
			SetVehicleDoorOpen(GetVehiclePedIsUsing(GetPlayerPed(-1)), 4, 0, 0)
		else 
			SetVehicleDoorShut(GetVehiclePedIsUsing(GetPlayerPed(-1)), 4, 0)
		end
	else
		chatPrint("You are not in a vehicle!")
	end
end)


function chatPrint( msg )
	TriggerEvent( 'chatMessage', "^1Admin", { 255, 255, 255 }, msg )
end 




