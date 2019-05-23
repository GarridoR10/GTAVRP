local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local markers = {}
local currentAction = nil
local currentActionData = nil
local lastClick = 0
local hidden = false

Markers = {}

Citizen.CreateThread(function()
	while true do
		local ped = GetPlayerPed(-1)
		local coords = GetEntityCoords(ped)

		if currentAction ~= nil and currentActionData ~= nil and currentActionData.position ~= nil then
			if GetDistanceBetweenCoords(coords, currentActionData.position.x, currentActionData.position.y, currentActionData.position.z, true) > 1.5 then
				ESX.UI.Menu.CloseAll()
			end
		end

		currentAction = nil
		currentActionData = nil

		for i=1, #markers, 1 do 
			local marker = markers[i]

			if GetDistanceBetweenCoords(coords, marker.position.x, marker.position.y, marker.position.z, true) < 50 then
				local size = {
					x = 0.75,
					y = 0.75,
					z = 0.1
				}

				if marker.size ~= nil then
					size = marker.size
				end

				if marker.type == nil then
					marker.type = 27
				end

				if not hidden then
					if marker.color == nil then
						DrawMarker(marker.type, marker.position.x, marker.position.y, marker.position.z + 0.05, 0.0, 0.0, 0.0, 0, 0.0, 0.0, size.x, size.y, size.z, 0, 0, 255, 75, false, false, 2, false, false, false, false)
					else
						DrawMarker(marker.type, marker.position.x, marker.position.y, marker.position.z + 0.05, 0.0, 0.0, 0.0, 0, 0.0, 0.0, size.x, size.y, size.z, marker.color.red, marker.color.green, marker.color.blue, marker.color.alpha, false, false, 2, false, false, false, false)
					end
				end

				if GetDistanceBetweenCoords(coords, marker.position.x, marker.position.y, marker.position.z, true) < 1.5 then
					currentAction = marker.id
					currentActionData = marker
				end
			end
		end

		if currentAction ~= nil then
			if IsPedInAnyVehicle(GetPlayerPed(-1)) or currentActionData.onlyVehicle ~= true then 
				SetTextComponentFormat('STRING')
	     		AddTextComponentString(currentActionData.message)
		  
	     		DisplayHelpTextFromStringLabel(0, 0, 1, -1)

	     		if IsControlPressed(0, Keys['E']) and (lastClick + 3000) < GetGameTimer() then
	     			currentActionData.callback()

	     			lastClick = GetGameTimer()
	     		end
	     	end
		end

		Citizen.Wait(0)
	end
end)

function Markers.AddMarker(id, position, message, callback, color, size, type, onlyVehicle)
	table.insert(markers, {
		id = id,
		position = position,
		message = message,
		callback = callback,
		color = color,
		size = size,
		type = type,
		onlyVehicle = onlyVehicle
	})
end

function Markers.RemoveMarker(id)
	for i=1, #markers, 1 do
		local marker = markers[i]

		if marker ~= nil then
			if marker.id == id then
				table.remove(markers, i)
			end
		end
	end
end

function Markers.RemoveAll()
	markers = {}
end

function Markers.HideAll()
	hidden = true
end

function Markers.ShowAll()
	hidden = false
end