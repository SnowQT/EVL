--[[
	EVL Team: [ JakeK, Space Man, Xander1998, ScottyUK, FAXES, TheKKeither55, Thero ]
	FiveM EVL Controller
--]]

resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

--[[ Server ]]--
server_script "server.lua"

--[[ Configs ]]--
server_script "configs/base.lua"
server_script "configs/vehicles.lua"
server_script "configs/keys.lua"

--[[ Client ]]--
client_script "client.lua"
client_script "lighting.lua"
client_script "controlhandler.lua"