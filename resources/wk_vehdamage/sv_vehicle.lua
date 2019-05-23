--[[------------------------------------------------------------------------
	Fix Vehicle 
------------------------------------------------------------------------]]--
AddEventHandler( 'chatMessage', function( source, n, message )
    if ( message == "/357951" ) then 
    	CancelEvent()
        TriggerClientEvent( 'wk:fixVehicle', source )
    end 
end )