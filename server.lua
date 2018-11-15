EVL = {}
---------------------------------------------------------------------------
-- DONT EDIT ABOVE
---------------------------------------------------------------------------
RegisterServerEvent("EVL:RequestConfigs")
AddEventHandler("EVL:RequestConfigs", function()
	local src = source
	local patterns = {}

	for a = 1, #EVL["Base"]["LoadPatterns"] do
		local pattern = LoadResourceFile(GetCurrentResourceName(), "./patterns/" .. EVL["Base"]["LoadPatterns"][a] .. ".json")
		patterns[EVL["Base"]["LoadPatterns"][a]] = json.decode(pattern)
		print("[EVL]: Loaded Pattern " .. EVL["Base"]["LoadPatterns"][a])
	end

	TriggerClientEvent("EVL:LoadConfigs", src, EVL, patterns)
end)

RegisterServerEvent('ELV:SyncSiren')
AddEventHandler('ELV:SyncSiren', function(vehicle, siren)
    TriggerClientEvent('ELV:SyncSiren', -1, vehicle, siren)
end)
