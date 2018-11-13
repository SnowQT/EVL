EVL = {}
Patterns = {}
EVL_Ready = false

isInVehicle = false
currentVehicle = 0

ControlledVehicles = {}

---------------------------------------------------------------------------
-- Loading EVL Configs
---------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetTimeout(1000, function()
		TriggerServerEvent("EVL:RequestConfigs")
	end)
end)

RegisterNetEvent("EVL:LoadConfigs")
AddEventHandler("EVL:LoadConfigs", function(_EVL, _Patterns)
	EVL = _EVL
	Patterns = _Patterns
	EVL_Ready = true
end)

---------------------------------------------------------------------------
-- Handles Entering and Exiting Vehicles
---------------------------------------------------------------------------
Citizen.CreateThread(function()
	DecorRegister("VehicleController", 3)
	while true do
		if EVL_Ready then
			local ped = GetPlayerPed(-1)
			if IsPedInAnyVehicle(ped, false) then
				if not isInVehicle then
					local vehicle = GetVehiclePedIsIn(ped, false)
					if IsVehicleEVL(vehicle) then
						RegisterEVLVehicle(vehicle, function()
							isInVehicle = true
							SetVehicleLightingColors(vehicle)
							currentVehicle = vehicle
						end)
					end
				end
			else
				if isInVehicle then
					isInVehicle = false
					Citizen.Wait(150)
					SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1, 1, 0)
				end
			end
		end
		Citizen.Wait(500)
	end
end)

---------------------------------------------------------------------------
-- Registers you as the controller of the EVL vehicle
---------------------------------------------------------------------------
function SetVehicleLightingColors(vehicle)
	for a = 1, #EVL["Vehicles"] do
		if GetHashKey(EVL["Vehicles"][a].model) == GetEntityModel(vehicle) then
			local colors = {["one"] = {["red"] = 16, ["blue"] = 53}, ["two"] = {["red"] = 28, ["blue"] = 70}}
			local color_one = string.lower(EVL["Vehicles"][a].color_one)
			local color_two = string.lower(EVL["Vehicles"][a].color_two)

			SetVehicleModColor_2(vehicle, 0, colors["one"][color_one])
			SetVehicleInteriorColour(vehicle, colors["two"][color_two])
		end
	end
end

function RegisterEVLVehicle(vehicle, callback)
	if not NetworkGetEntityIsNetworked(vehicle) then
		NetworkRegisterEntityAsNetworked(vehicle)
		while not NetworkGetEntityIsNetworked(vehicle) do
			Citizen.Wait(0)
		end
		DecorSetInt(vehicle, "VehicleController", GetPlayerServerId(PlayerId()))
	end
	callback()
end

---------------------------------------------------------------------------
-- Checks if your vehicle is a registered EVL vehicle
---------------------------------------------------------------------------
function IsVehicleEVL(vehicle)
	for a = 1, #EVL["Vehicles"] do
		if GetHashKey(EVL["Vehicles"][a].model) == GetEntityModel(vehicle) then
			return true
		end
	end
	return false
end