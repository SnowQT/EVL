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
		patterns[EVL["Base"]["LoadPatterns"][a]] = pattern
	end

	TriggerClientEvent("EVL:LoadConfigs", src, EVL, patterns)
end)