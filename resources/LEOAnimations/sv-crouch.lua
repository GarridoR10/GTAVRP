-- Add an event handler for the 'chatMessage' event
AddEventHandler( 'chatMessage', function( source, n, msg )  

    msg = string.lower( msg )
    
    -- Check to see if a client typed in /crouch or /cr 
    if ( msg == "/crouch" or msg == "/cr" ) then 
    
        -- Cancel the chat message event (stop the server from posting the message)
        CancelEvent() 

        -- Trigger the client event 
        TriggerClientEvent( 'playerCrouch', source )
    end
end )

print( "WolfKnight's Crouch Script Loaded." )