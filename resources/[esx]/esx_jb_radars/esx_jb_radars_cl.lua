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

ESX = nil
local LoadedPropList = {}
local coyottestate = false
local inmarker = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	if Config.ShowRadarProps then
		LoadRadarProps()
	end
end)

-- create radar props
function LoadRadarProps()
	local propName = 'prop_cctv_pole_01a'
	RequestModel(propName)
	while not HasModelLoaded(propName) do
		Citizen.Wait(100)
	end

	for k, v in pairs(Config.Radars) do
		local radar = CreateObject(GetHashKey(propName), v.x, v.y, v.z - 7, true, true, true)

		SetObjectTargettable(radar, true)
		SetEntityHeading(radar, v.heading - 115)
		SetEntityAsMissionEntity(radar, true, true)
		FreezeEntityPosition(radar, true)

		table.insert(LoadedPropList, radar)
	end
end

function UnloadRadarProps()
	for k, v in pairs(LoadedPropList) do
		DeleteEntity(v)
	end
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		UnloadRadarProps()
	end
end)

RegisterNetEvent('esx_jb_radars:ShowRadarBlip')
AddEventHandler('esx_jb_radars:ShowRadarBlip', function()
	coyottestate = true
	for k,v in pairs (Config.Radars) do
		exports.ft_libs:ShowBlip("esx_jb_radars_blip_"..k)
	end
end)
RegisterCommand("show", function(source, args, raw)
		coyottestate = true
	for k,v in pairs (Config.Radars) do
		exports.ft_libs:ShowBlip("esx_jb_radars_blip_"..k)
	end 
end, false)

RegisterNetEvent('esx_jb_radars:ShowRadarProp')
AddEventHandler('esx_jb_radars:ShowRadarProp', function()
	LoadRadarProps()
end)

RegisterNetEvent('esx_jb_radars:RemoveRadarBlip')
AddEventHandler('esx_jb_radars:RemoveRadarBlip', function()
	coyottestate = false
	for k,v in pairs (Config.Radars) do
		exports.ft_libs:HideBlip("esx_jb_radars_blip_"..k)
	end
end)
RegisterCommand("hide", function(source, args, raw)
		coyottestate = false
	for k,v in pairs (Config.Radars) do
		exports.ft_libs:HideBlip("esx_jb_radars_blip_"..k)
	end
end, false)

local lastRadar = nil
-- Determines if player is close enough to trigger cam
function HandlespeedCam(kmhSpeed, maxSpeed, Plate, vehicleModel, radarStreet)
	local fine = 0
	local TooMuchSpeed = tonumber(kmhSpeed) - tonumber(maxSpeed)
	if TooMuchSpeed >= 25 and TooMuchSpeed <= 50 then
		fine =500 + (TooMuchSpeed*Config.KmhFine)
	elseif TooMuchSpeed > 50 and TooMuchSpeed <= 100 then
		fine =750 + (TooMuchSpeed*Config.KmhFine)
	elseif TooMuchSpeed > 100 and TooMuchSpeed <= 125 then
		fine =1000 + (TooMuchSpeed*Config.KmhFine)
	elseif TooMuchSpeed > 125 and TooMuchSpeed <= 150 then
		fine =1250 + (TooMuchSpeed*Config.KmhFine)
	elseif TooMuchSpeed > 150 and TooMuchSpeed <= 175 then
		fine =1500 + (TooMuchSpeed*Config.KmhFine)
	elseif TooMuchSpeed > 175 then
		fine =1750 + (TooMuchSpeed*Config.KmhFine)
	end
	if TooMuchSpeed >= 25 then
		SetTimeout(math.random(Config.MinWaitTimeBeforeGivingFine*1000, Config.MaxWaitTimeBeforeGivingFine*1000), function()
			TriggerServerEvent('esx_jb_radars:PayFine',GetPlayerServerId(PlayerId()), Plate, kmhSpeed, maxSpeed, fine, vehicleModel, radarStreet)
		end)
	end
end

local highspeed = 0
local numberPlate = ""
local model = ""
local street1 = ""
RegisterNetEvent("ft_libs:OnClientReady")
AddEventHandler('ft_libs:OnClientReady', function()
	for k,v in pairs (Config.Radars) do
		exports.ft_libs:AddBlip("esx_jb_radars_blip_"..k, {
			x = v.x,
			y = v.y,
			z = v.z,
			text = ('Radar fixe: %s (%s)'):format(k, v.maxSpeed),
			enable = false
		})
		exports.ft_libs:AddArea("esx_jb_radars_"..k, {
			trigger = {
				weight = v.alertradarrange,
				active = {
					callback = function()
						local myPed = GetPlayerPed(-1)
						local vehicle = GetPlayersLastVehicle()
						local coords      = GetEntityCoords(myPed)
						local distance = GetDistanceBetween3DCoords(v.x, v.y, v.z, coords.x, coords.y, coords.z)
						local ispedinvehicle = IsPedInAnyVehicle(myPed, false)
						if ispedinvehicle and coyottestate and not inmarker then
							SendNUIMessage({playsong = 'true', songname= v.maxSpeed})
							inmarker = true
						end
						if ispedinvehicle and distance < Config.SpeedCamRange then
							if GetPedInVehicleSeat(vehicle, -1) == myPed then
								if GetVehicleClass(vehicle) ~= 18 then
								local kmhSpeed = math.ceil(GetEntitySpeed(vehicle)* 3.6)
								numberPlate = GetVehicleNumberPlateText(vehicle)
								local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0,v.x, v.y, v.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
								street1 = GetStreetNameFromHashKey(s1)
								model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
									if (tonumber(kmhSpeed) > tonumber(v.maxSpeed)) and (tonumber( highspeed) < tonumber(kmhSpeed)) then
										highspeed = kmhSpeed
									end
								end
							end
						end
					end,
				},
				exit = {
					callback = function()
						if highspeed ~= 0 then
							HandlespeedCam(highspeed, v.maxSpeed, numberPlate, model, street1)
							highspeed = 0
							Citizen.Wait(500)
						end
						highspeed = 0
						Citizen.Wait(500)
						inmarker = false
						
					end,
				},
			},
			locations = {
				{
					x = v.x,
					y = v.y,
					z = v.z,
				}
			},
		})
	end
end)
function GetDistanceBetween3DCoords(x1, y1, z1, x2, y2, z2)

    if x1 ~= nil and y1 ~= nil and z1 ~= nil and x2 ~= nil and y2 ~= nil and z2 ~= nil then
        return math.sqrt((x1 - x2) ^ 2 + (y1 - y2) ^ 2 + (z1 - z2) ^ 2)
    end
    return -1

end

function dump(o, nb)
  if nb == nil then
    nb = 0
  end
   if type(o) == 'table' then
      local s = ''
      for i = 1, nb + 1, 1 do
        s = s .. "    "
      end
      s = '{\n'
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
          for i = 1, nb, 1 do
            s = s .. "    "
          end
         s = s .. '['..k..'] = ' .. dump(v, nb + 1) .. ',\n'
      end
      for i = 1, nb, 1 do
        s = s .. "    "
      end
      return s .. '}'
   else
      return tostring(o)
   end
end