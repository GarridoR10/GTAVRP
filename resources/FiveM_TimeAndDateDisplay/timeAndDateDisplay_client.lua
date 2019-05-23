-- CONFIG --
local displayTime = true
local useMilitaryTime = true

-- en for english translate
local lang = 'en' 

local timeAndDateString = nil
local hour
local minute

-- CODE --
function drawTxt2(x,y ,width,height,scale, text, r,g,b,a)
        SetTextFont(6)
        SetTextProportional(1)
        SetTextScale(0.0, 0.48)
        SetTextColour(185, 185, 185, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(x, y)
end

Citizen.CreateThread(function()
	while true do
		Wait(1)
		timeAndDateString = ""
		
		if displayTime == true then
			CalculateTimeToDisplay()
			timeAndDateString = timeAndDateString .. hour .. ":" .. minute  -- Example: Time: 00:00
		end
		
                 SetTextFont(6)
                 SetTextProportional(1)
                 SetTextScale(0.0, 0.48)
                 SetTextColour(185, 185, 185, 255)
                 SetTextDropshadow(0, 0, 0, 0, 255)
                 SetTextEdge(1, 0, 0, 0, 255)
                 SetTextDropShadow()
                 SetTextOutline()
                 SetTextEntry("STRING")
		
		AddTextComponentString(timeAndDateString)
		DrawText(0.180, 0.840)
	end
end)

function CalculateTimeToDisplay()
	hour = GetClockHours()
	minute = GetClockMinutes()

	if useMilitaryTime == false then
		if hour == 0 or hour == 24 then
			hour = 12
		elseif hour >= 13 then
			hour = hour - 12
		end
	end

	if hour <= 9 then
		hour = "0" .. hour
	end
	if minute <= 9 then
		minute = "0" .. minute
	end
end