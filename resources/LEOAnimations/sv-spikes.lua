AddEventHandler('chatMessage', function(source, n, msg)
   msg = string.lower(msg)
   if (msg == "/setspike") then
      CancelEvent()
      TriggerClientEvent('c_setSpike', source)
   end
end)

AddEventHandler('chatMessage', function(source, n, msg)
   msg = string.lower(msg)
   if (msg == "/delspike") then
      CancelEvent()
      TriggerClientEvent('c_deleteSpike', source)
   end
end)