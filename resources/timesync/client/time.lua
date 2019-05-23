-- CONFIG --

-- How many milliseconds should 1 second be?
local waitTime = 33

-- CODE --

TriggerServerEvent("ts:newplayer")

RegisterNetEvent("ts:timesync")
AddEventHandler("ts:timesync", function(time)
		Citizen.CreateThread(function()
		while true do
			Wait(waitTime)
			newTime = time

			newTime.s = newTime.s + 1
			if newTime.s > 59 then
				newTime.s = 0

				newTime.m = newTime.m + 1
				if newTime.m > 59 then
					newTime.m = 0

					newTime.h = time.h + 1
					if newTime.h > 23 then
						newTime.h = 0
					end
				end
			end

			NetworkOverrideClockTime(newTime.h, newTime.m, newTime.s)
			TriggerServerEvent("ts:timesync", newTime)
		end
	end)
end)