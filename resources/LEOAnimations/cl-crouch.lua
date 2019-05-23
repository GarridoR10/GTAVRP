-- VARIABLE(S)
local crouched = false

-- Register the network event(s)
RegisterNetEvent( 'playerCrouch' )

-- The main event handler 
AddEventHandler( 'playerCrouch', function()
    -- Get the local ped 
    local ped = GetPlayerPed( -1 )

    -- Make sure the player is alive
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 

        -- Here we create thread, but notice how we don't have a while loop.
        -- This is because we use it to Wait for the animation dictionary to load.
        Citizen.CreateThread( function()        
            -- Request the crouched animation set     
            RequestAnimSet( "move_ped_crouched" )

            -- Wait until it has loaded 
            while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
                Citizen.Wait( 100 )
            end 

            -- We inverse the crouch variable for the next time it is called 
            if ( crouched == true ) then 
                ResetPedMovementClipset( ped, 0 )
                crouched = false 
            elseif ( crouched == false ) then
                SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                crouched = true 
            else
                Citizen.Trace( "Crouch Script Error: variable 'crouched' not found or not a boolean value." )
            end 
        end )
    end 
end )