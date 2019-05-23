Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, 56) then
            if GetVehiclePedIsIn(GetPlayerPed(-1), false) ~= nil then
                if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false)) < 1 then
                   SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), (not IsVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false))), true, false)
                end
            end
        end
    end
end)