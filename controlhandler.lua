local UsingKeyboard = false

Citizen.CreateThread(function()
	while true do
		if EVL_Ready and IsPedInAnyVehicle(GetPlayerPed(-1), false) then

			UsingKeyboard = GetLastInputMethod(0)

			-- Disable Default Keys
			if UsingKeyboard then
				local Keys = EVL["Keys"]["Keyboard"]
				DisableKeyboardKeys(Keys)

				if not IsDisabledControlPressed(0, Keys["KeyModifier"]) then
				    
					if IsDisabledControlJustPressed(0, Keys["ChangeLightStage"]) then
						print("Increase Light Stage")
					elseif IsDisabledControlJustPressed(0, Keys["ChangePrimaryPattern"]) then
						print("Increase Primary Pattern")
					elseif IsDisabledControlJustPressed(0, Keys["ChangeSecondaryPattern"]) then
						print("Increase Secondary Pattern")
					elseif IsDisabledControlJustPressed(0, Keys["ChangeTrafficPattern"]) then
						print("Increase Traffic Pattern")
					elseif IsDisabledControlJustPressed(0, Keys["WarningLights"]) then
						print("Toggle Warning Lights")
					elseif IsDisabledControlJustPressed(0, Keys["SecondaryLights"]) then
						print("Toggle Secondary Lights")
					elseif IsDisabledControlJustPressed(0, Keys["PrimaryLights"]) then
						LightsToggle()
					elseif IsDisabledControlJustPressed(0, Keys["SirenOne"]) then
						SirenChange(1)
					elseif IsDisabledControlJustPressed(0, Keys["SirenTwo"]) then
						SirenChange(2)
					elseif IsDisabledControlJustPressed(0, Keys["SirenThree"]) then
						SirenChange(3)
					end

				else

					if IsDisabledControlJustPressed(1, Keys["ChangeLightStage"]) then
						print("Increase Light Stage")
					elseif IsDisabledControlJustPressed(1, Keys["TakedownLights"]) then
						print("Toggle Takedown Lights")
					elseif IsDisabledControlJustPressed(1, Keys["ChangePrimaryPattern"]) then
						print("Decrease Primary Pattern")
					elseif IsDisabledControlJustPressed(1, Keys["ChangeSecondaryPattern"]) then
						print("Decrease Secondary Pattern")
					elseif IsDisabledControlJustPressed(1, Keys["ChangeTrafficPattern"]) then
						print("Decrease Traffic Pattern")
					elseif IsDisabledControlJustPressed(1, Keys["TogglePanel"]) then
						print("Toggle EVL UI")
					end

				end
			end
		end
		Citizen.Wait(0)
	end
end)

function DisableKeyboardKeys(Keys)
	DisableControlAction(0, Keys["KeyModifier"], true)
	DisableControlAction(0, Keys["ChangeLightStage"], true)
	DisableControlAction(0, Keys["ChangePrimaryPattern"], true)
	DisableControlAction(0, Keys["ChangeSecondaryPattern"], true)
	DisableControlAction(0, Keys["ChangeTrafficPattern"], true)
	DisableControlAction(0, Keys["WarningLights"], true)
	DisableControlAction(0, Keys["SecondaryLights"], true)
	DisableControlAction(0, Keys["PrimaryLights"], true)
	DisableControlAction(0, Keys["TogglePanel"], true)
	DisableControlAction(0, Keys["SirenOne"], true)
	DisableControlAction(0, Keys["SirenTwo"], true)
	DisableControlAction(0, Keys["SirenThree"], true)
end

function DisableControllerButtons(Buttons)

end
