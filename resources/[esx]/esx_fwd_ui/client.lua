RegisterNetEvent('ESX_FWD_UI:updateStatus')
AddEventHandler('ESX_FWD_UI:updateStatus', function(Status)
    status = Status
    SendNUIMessage({
        action = "updateStatus",
        st = Status,
    })
end)