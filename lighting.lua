---------------------------------------------------------------------------
-- Handles Entered Vehicle Lighting
---------------------------------------------------------------------------
local lightsOn = false
local currentPattern = Patterns[1]

function LightsToggle()
	lightsOn = not lightsOn
	if not lightsOn then
		local LightingData = Patterns[currentPatern]["Data"]
		local LightingPattern = Patterns[currentPattern]["Pattern"]
	
		for a = 1, #LightingPattern do
			for c = 1, #LightingPattern[a] do
				SetVehicleMod(currentVehicle, LightingPattern[a][c], 0, false)
			end
		end
	end
end

Citizen.CreateThread(function()
	while true do
		if currentVehicle ~= 0 and EVL_Ready and lightsOn then

			local LightingData = Patterns[currentPattern]["Data"]
			local LightingPattern = Patterns[currentPattern]["Pattern"]

			for a = 1, #LightingPattern do
				for b = 1, #LightingPattern[a] do
					SetVehicleMod(currentVehicle, LightingPattern[a][b], 1, false)
				end
				Citizen.Await(LightingData.TimeBetween)
				for c = 1, #LightingPattern[a] do
					SetVehicleMod(currentVehicle, LightingPattern[a][c], 0, false)
				end
				Citizen.Await(LightingData.TimeNext)
			end

		end
		Citizen.Wait(0)
	end
end)

function Citizen.Await(time)
	local timeStart = GetGameTimer() + time
	while GetGameTimer() < timeStart do
		Citizen.Wait(0)
	end
	return true
end
