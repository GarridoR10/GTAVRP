Config = {}

Config.DisableOldUI = true -- Valid BOOLEAN options: true or false

--[[
    --!!! DON'T FORGET TO ADD THIS AT THE END OF ES_EXTENDED/CLIENT/MAIN.LUA !!!

    RegisterNetEvent('esx:slideui_hideoldui')
    AddEventHandler('esx:slideui_hideoldui', function(disableui)
        if disableui then
            TriggerEvent('es:setMoneyDisplay', 0.0)
            ESX.UI.HUD.SetDisplay(0.0)
        else
            TriggerEvent('es:setMoneyDisplay', 1.0)
            ESX.UI.HUD.SetDisplay(1.0)
        end
    end)

]]