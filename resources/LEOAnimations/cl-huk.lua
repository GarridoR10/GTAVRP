function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent( 'KneelHU' )
AddEventHandler( 'KneelHU', function()
	local ped = GetPlayerPed( -1 )
	local wep = GetSelectedPedWeapon(ped)
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then
        loadAnimDict( "random@arrests" )
        loadAnimDict( "random@arrests@busted" )
        if ( IsEntityPlayingAnim( ped, "random@arrests@busted", "idle_a", 3 ) ) then
	    TaskPlayAnim( ped, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
            Wait (3000)
            TaskPlayAnim( ped, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
	    SetEnableHandcuffs(ped, false)
	    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        else
            ClearPedSecondaryTask(ped)
	    SetEnableHandcuffs(ped, true)
	    TaskPlayAnim( ped, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
            Wait (4000)
	    SetPedDropsInventoryWeapon(ped, wep, 0, 2.0, 0, -1)
	    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
            TaskPlayAnim( ped, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
            Wait (500)
            TaskPlayAnim( ped, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
            Wait (1000)
            TaskPlayAnim( ped, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
        end    
    end
end )
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
            DisableControlAction(0, 21, true)
	    DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)
