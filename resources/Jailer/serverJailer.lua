--Coded by Albo1125.

local jailPassword = "snake" --change this password to your liking and don't share it with the criminals ;-)
local defaultsecs = 180
local maxsecs = 5400

-----------------------------

AddEventHandler('chatMessage', function(source, n, message)
    cm = stringsplit(message, " ")

    if(cm[1] == "/jailme") then
		CancelEvent()
		local jT = defaultsecs
		if cm[2] ~= nil then
			jT = tonumber(cm[2])				
		end
		if jT > maxsecs then
			jT = maxsecs
		end
		
		print("Jailing ".. GetPlayerName(source) .. " for ".. jT .." secs")
		TriggerClientEvent("JP", source, jT)
		TriggerClientEvent('chatMessage', -1, 'JUDGE', { 0, 0, 0 }, GetPlayerName(source) ..' jailed for '.. jT ..' secs')
    elseif cm[1] == "/unjail" then
		CancelEvent()
		if cm[2] == jailPassword then
			local tPID = tonumber(cm[3])
			if GetPlayerName(tPID) ~= nil then
				print("Unjailing ".. GetPlayerName(tPID).. " - cm entered by ".. GetPlayerName(source))
				TriggerClientEvent("UnJP", tPID)
			end
		else
			print("Incorrect jailPassword entered by ".. GetPlayerName(source))
		end
	elseif cm[1] == "/jail" then
		CancelEvent()
		if tablelength(cm) > 2 then
			if cm[2] == jailPassword then
				local tPID = tonumber(cm[3])
				local jT = defaultsecs
				if tablelength(cm) > 3 then
					if cm[4] ~= nil then
						jT = tonumber(cm[4])				
					end
				end
				if jT > maxsecs then
					jT = maxsecs
				end
				if GetPlayerName(tPID) ~= nil then
					print("Jailing ".. GetPlayerName(tPID).. " for ".. jT .." secs - cm entered by ".. GetPlayerName(source))
					TriggerClientEvent("JP", tPID, jT)
					TriggerClientEvent('chatMessage', -1, 'JUDGE', { 0, 0, 0 }, GetPlayerName(tPID) ..' jailed for '.. jT ..' secs')
				end
			else
				print("Incorrect jailPassword entered by ".. GetPlayerName(source))
			end
		end
	end
end)

print('Jailer by Albo1125 (LUA, FXServer, FiveM).')
function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
--Coded by Albo1125