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
						print("Toggle Primary Lights")
					elseif IsDisabledControlJustPressed(0, Keys["SirenOne"]) then
						print("Toggle Siren One")
					elseif IsDisabledControlJustPressed(0, Keys["SirenTwo"]) then
						print("Toggle Siren Two")
					elseif IsDisabledControlJustPressed(0, Keys["SirenThree"]) then
						print("Toggle Siren Three")
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
	for i in pairs(Keys) do
		DisableControlAction(0, Keys[i], true)
	end
end

function DisableControllerButtons(Buttons)

end
