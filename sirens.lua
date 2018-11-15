---------------------------------------------------------------------------
-- Handles Entered Vehicle Sirens
---------------------------------------------------------------------------
local sirenOn = false; local currentSiren = 0; local soundId = nil; local lastSiren = 0

function SirenToggle()
    sirenOn = not sirenOn
    if sirenOn then TriggerServerEvent('ELV:SyncSiren', currentVehicle, currentSiren) end
end

function SirenChange(changingSiren)
    currentSiren = changingSiren
    if not sirenOn then
        SirenToggle()
    elseif sirenOn and changingSiren == lastSiren then
        SirenToggle()
    else
        TriggerServerEvent('ELV:SyncSiren', currentVehicle, currentSiren)
    end
    lastSiren = changingSiren
end

Citizen.CreateThread(function()
    while true do
        if not sirenOn then StopSound(soundId) end
        if IsVehicleSirenOn(currentVehicle) then SetVehicleSiren(currentVehicle, false) end
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('ELV:SyncSiren')
AddEventHandler('ELV:SyncSiren', function(vehicle, siren)
    if siren == 1 then siren = 'VEHICLES_HORNS_SIREN_1' end
    if siren == 2 then siren = 'VEHICLES_HORNS_SIREN_2' end
    if siren == 3 then siren = 'VEHICLES_HORNS_POLICE_WARNING' end
    if soundId then StopSound(soundId) end
    soundId = GetSoundId()
    PlaySoundFromEntity(soundId, siren, vehicle, 0, 0)
end)
