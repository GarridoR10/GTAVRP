------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------- Authors Morow https://github.com/Morow73 --------------------------------------------
ESX          = nil
local IsDead = false

AddEventHandler('esx_addonneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'force', 50000) 

end)

AddEventHandler('esx_addonneeds:resetStatus', function()
    TriggerEvent('esx_status:set', 'tir', 50000) 

end)

AddEventHandler('esx_addonneeds:resetStatus', function()
    TriggerEvent('esx_status:set', 'endu', 50000) 

end)

AddEventHandler('esx_addonneeds:resetStatus', function()
    TriggerEvent('esx_status:set', 'drive', 50000) 

end)

AddEventHandler('esx_addonneeds:resetStatus', function()
    TriggerEvent('esx_status:set', 'nage', 50000) 

end)



AddEventHandler('playerSpawned', function()

	if IsDead then
		TriggerEvent('esx_addonneeds:resetStatus')
	end

	IsDead = false
end)

AddEventHandler('esx_status:loaded', function(status)

   TriggerEvent('esx_status:registerStatus', 'force', 0, ' 	#FFD700', ----- jaune 
        function(status)
            if Config.EnableHud == true then          
                if status.val > 0 then
                    return true
                else
                    return false
                end
            else 
              return false 
            end  
        end,
		function(status)
			status.remove(Config.RemoveForce)
		end
    )
	
	
   Citizen.CreateThread(function()
	    while true do
	        Wait(5000)
	        TriggerEvent('esx_status:getStatus', 'force', function(status)
                if status.val <= 0 then    
                    StatSetInt(GetHashKey('MP0_STAMINA'), 0, true)
                    StatSetInt(GetHashKey('MP0_STRENGTH'), 0, true)
                elseif status.val >= 250000 then
                    StatSetInt(GetHashKey('MP0_STAMINA'), 25, true)
                    StatSetInt(GetHashKey('MP0_STRENGTH'), 25, true)
                elseif status.val >= 500000 then
                    StatSetInt(GetHashKey('MP0_STAMINA'), 50, true)
                    StatSetInt(GetHashKey('MP0_STRENGTH'), 50, true)
                elseif status.val >= 750000 then
                    StatSetInt(GetHashKey('MP0_STAMINA'), 75, true)
                    StatSetInt(GetHashKey('MP0_STRENGTH'), 75, true)    
                elseif status.val == 1000000 then
                    StatSetInt(GetHashKey('MP0_STAMINA'), 100, true)
                    StatSetInt(GetHashKey('MP0_STRENGTH'), 100, true) 
                end  
            end)
        end
    end)
end)	

AddEventHandler('esx_status:loaded', function(status)

   TriggerEvent('esx_status:registerStatus', 'drive', 0, '  #FF8C00', -- orange
        function(status)
            if Config.EnableHud == true then          
              if status.val > 0 then
                return true
              else
                return false
              end
            else 
                return false 
            end   
        end,
        function(status)
            status.remove(Config.RemoveConduite)
        end
    )
    

    Citizen.CreateThread(function()
        while true do
            Wait(5000)     
            TriggerEvent('esx_status:getStatus', 'drive', function(status) 
                if status.val <= 0 then 
                    StatSetInt(GetHashKey('MP0_DRIVING_ABILITY'), 0, true) 
                elseif status.val == 100000 then
                    StatSetInt(GetHashKey('MP0_DRIVING_ABILITY'), 10, true) 
                elseif status.val == 250000 then 
                   StatSetInt(GetHashKey('MP0_DRIVING_ABILITY'), 25, true)                
                elseif status.val == 500000 then 
                    StatSetInt(GetHashKey('MP0_DRIVING_ABILITY'), 50, true)   
                elseif status.val == 750000 then 
                   StatSetInt(GetHashKey('MP0_DRIVING_ABILITY'), 75, true) 
                elseif status.val == 1000000 then 
                    StatSetInt(GetHashKey('MP0_DRIVING_ABILITY'), 100, true)    
                end      
            end)            
        end
    end)
end)      

AddEventHandler('esx_status:loaded', function(status)

   TriggerEvent('esx_status:registerStatus', 'tir', 0, '  #ffffff', -- blanc
        function(status)
            if Config.EnableHud == true then  
              if status.val > 0 then
                return true
              else
                return false
              end
            else 
              return false
            end   
        end,
        function(status)
            status.remove(Config.RemoveTir)
        end
    )
    

    Citizen.CreateThread(function()
        while true do
            Wait(5000)     
            TriggerEvent('esx_status:getStatus', 'tir', function(status)    
                if status.val <= 0 then 
                   StatSetInt(GetHashKey('MP0_SHOOTING_ABILITY'), 0, true) 
                elseif status.val == 100000 then
                    StatSetInt(GetHashKey('MP0_SHOOTING_ABILITY'), 10, true)   
                elseif status.val == 250000 then 
                    StatSetInt(GetHashKey('MP0_SHOOTING_ABILITY'), 25, true)  
                elseif status.val == 500000 then 
                    StatSetInt(GetHashKey('MP0_SHOOTING_ABILITY'), 50, true) 
                elseif status.val == 750000 then 
                    StatSetInt(GetHashKey('MP0_SHOOTING_ABILITY'), 75, true) 
                elseif status.val == 1000000 then 
                    StatSetInt(GetHashKey('MP0_SHOOTING_ABILITY'), 100, true)      
                end           
            end)        
        end
    end)
end)   

AddEventHandler('esx_status:loaded', function(status)

   TriggerEvent('esx_status:registerStatus', 'endu', 0, '  #97784d', -- marron
        function(status)
            if Config.EnableHud == true then   
              if status.val > 0 then
                return true
              else
                return false
              end
            else 
                return false
            end  
        end,
        function(status)
            status.remove(Config.RemoveEndurance)
        end
    )
    

    Citizen.CreateThread(function()
        while true do
            Wait(5000) 
            TriggerEvent('esx_status:getStatus', 'endu', function(status)        
                if status.val <= 0 then 
                    StatSetInt(GetHashKey('MP0_STAMINA'), 0, true)
                elseif status.val == 100000 then
                    StatSetInt(GetHashKey('MP0_STAMINA'), 10, true)  
                elseif status.val == 250000 then 
                    StatSetInt(GetHashKey('MP0_STAMINA'), 25, true) 
                elseif status.val == 500000 then 
                    StatSetInt(GetHashKey('MP0_STAMINA'), 50, true)
                elseif status.val == 750000 then 
                   StatSetInt(GetHashKey('MP0_STAMINA'), 75, true)
                elseif status.val == 1000000 then 
                    StatSetInt(GetHashKey('MP0_STAMINA'), 100, true)      
                end      
            end)   
        end
    end)
end)  

AddEventHandler('esx_status:loaded', function(status)

   TriggerEvent('esx_status:registerStatus', 'nage', 0, ' #87dc14', -- vert
        function(status)
            if Config.EnableHud == true then   
              if status.val > 0 then
                return true
              else
                return false
              end
            else
              return false
            end    
        end,
        function(status)
            status.remove(Config.RemoveNage)
        end
    )
    

    Citizen.CreateThread(function()
        while true do
            Wait(5000)     
            TriggerEvent('esx_status:getStatus', 'nage', function(status)             
                if status.val <= 0 then 
                    StatSetInt(GetHashKey('MP0_LUNG_CAPACITY'), 0, true)     
                elseif status.val == 100000 then
                    StatSetInt(GetHashKey('MP0_LUNG_CAPACITY'), 10, true)     
                elseif status.val == 250000 then 
                    StatSetInt(GetHashKey('MP0_LUNG_CAPACITY'), 25, true)     
                elseif status.val == 500000 then 
                    StatSetInt(GetHashKey('MP0_LUNG_CAPACITY'), 50, true)        
                elseif status.val == 750000 then 
                    StatSetInt(GetHashKey('MP0_LUNG_CAPACITY'), 75, true)       
                elseif status.val == 1000000 then 
                    StatSetInt(GetHashKey('MP0_LUNG_CAPACITY'), 100, true)         
                end                             
            end)        
        end
    end)
end) 

Citizen.CreateThread(function()
    while true do
        Wait(5000)

        if IsPedShooting(GetPlayerPed(-1)) then
            TriggerEvent('esx_status:add', 'tir', Config.ExpTir)
        elseif IsPedRunning(GetPlayerPed(-1)) then 
            TriggerEvent('esx_status:add', 'endu', Config.ExpEndurance)  
        elseif IsPedSwimmingUnderWater(GetPlayerPed(-1)) then
            TriggerEvent('esx_status:add', 'nage', Config.ExpNage) 
        elseif IsPedInMeleeCombat(GetPlayerPed(-1)) then 
            TriggerEvent('esx_status:add', 'force', Config.ExpForce)  
        elseif IsPedInVehicle(GetPlayerPed(-1), GetVehiclePedIsUsing(GetPlayerPed(-1)), true) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), GetVehiclePedIsUsing(GetPlayerPed(-1))), -1) then
            local vitesse = GetEntitySpeed(GetVehiclePedIsUsing(GetPlayerPed(-1))) * 3.6
            if vitesse >= 100 then
               TriggerEvent('esx_status:add', 'drive', Config.ExpConduite)
            end               
        end    
    end
end) 

-- coke effect for push

RegisterNetEvent('esx_addonneeds:cokeeffect')
AddEventHandler('esx_addonneeds:cokeeffect', function(source)

    StatSetInt(GetHashKey('MP0_STAMINA'), 100, true)
    StatSetInt(GetHashKey('MP0_STRENGTH'), 100, true)
    StartScreenEffect('DrugsDrivingIn', 150000, true)
    Citizen.Wait(150000)

    StatSetInt(GetHashKey('MP0_STAMINA'), 0, true)
    StatSetInt(GetHashKey('MP0_STRENGTH'), 0, true)

end)  