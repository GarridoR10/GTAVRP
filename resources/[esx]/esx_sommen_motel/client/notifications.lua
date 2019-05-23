local currentMessage = "SHOW_MISSION_PASSED_MESSAGE"
local rt = ""
local displayDoneMission = false
local notificationMessage = ""

Notifications = {}

Citizen.CreateThread(function()
	while true do
		if displayDoneMission then
			Citizen.Wait(5000)

			currentMessage = "TRANSITION_OUT"

			PushScaleformMovieFunction(rt, "TRANSITION_OUT")
			PopScaleformMovieFunction()

			Citizen.Wait(2000)

			displayDoneMission = false
			notificationMessage = ""
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if(HasScaleformMovieLoaded(rt) and displayDoneMission) then
			if(currentMessage == "SHOW_MISSION_PASSED_MESSAGE")then
				PushScaleformMovieFunction(rt, currentMessage)
				
				BeginTextComponent("STRING")
				AddTextComponentString(notificationMessage)
				EndTextComponent()
				BeginTextComponent("STRING")
				AddTextComponentString("Hmmmm")
				EndTextComponent()

				PushScaleformMovieFunctionParameterInt(145)
				PushScaleformMovieFunctionParameterBool(true)
				PushScaleformMovieFunctionParameterInt(1)
				PushScaleformMovieFunctionParameterBool(false)
				PushScaleformMovieFunctionParameterInt(69)

				PopScaleformMovieFunctionVoid()

				Citizen.InvokeNative(0x61bb1d9b3a95d802, 1)
			end
			
			DrawScaleformMovieFullscreen(rt, 255, 255, 255, 255)
		end
	end
end)

function Notifications.PlaySpecialNotification(message)
	Citizen.CreateThread(function()
		RegisterScriptWithAudio(0)
		SetAudioFlag("AvoidMissionCompleteDelay", true)
		PlayMissionCompleteAudio("FRANKLIN_BIG_01")
				
		currentMessage = "SHOW_MISSION_PASSED_MESSAGE"
		rt = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")
				
		StartScreenEffect("SuccessFranklin",  6000,  false)
				
		displayDoneMission = true
	end)

	notificationMessage = message
end