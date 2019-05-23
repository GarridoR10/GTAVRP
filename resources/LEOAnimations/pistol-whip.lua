local ped = GetPlayerPed( -1 )
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsPedArmed(ped, 6) then
			DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)