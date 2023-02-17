local QBCore = exports['qb-core']:GetCoreObject()

local dancing = false
local Poles = {}

CreateThread(function()
	for k, v in pairs(Config.Poles) do
		Poles["UniDance"..k] =
		exports['qb-target']:AddBoxZone("UniDance"..k, v.coords.xyz, 0.7, 0.7, { name="UniDance"..k, heading = v.coords.w, debugPoly=Config.Debug, minZ = v.minZ, maxZ = v.maxZ, },
			{ options = { { event = "qb-sandybarunicorn:Dance", icon = "fas fa-chair", label = Loc[Config.Lan].info["dance"], job = "sandybar", loc = v.coords, pole = v.pole }, },
				distance = v.distance })
	end
	for k, v in pairs(Config.Dance) do
		Poles["UniPvtDance"..k] =
			exports['qb-target']:AddBoxZone("UniPvtDance"..k, v.coords.xyz, 0.7, 0.7, { name="UniPvtDance"..k, heading = v.coords.w, debugPoly=Config.Debug, minZ = v.minZ, maxZ = v.maxZ, },
				{ options = { { event = "qb-sandybarunicorn:PvtDance", icon = "fas fa-chair", label = Loc[Config.Lan].info["dance"], job = "sandybar", loc = v.coords, }, },
					distance = 1.7 })
	end
end)

RegisterNetEvent('qb-sandybarunicorn:Dance', function(data)
	local canDance = true
	local dancing = false
	for _, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc.xyz, 0.6)) do
		if #(GetEntityCoords(GetPlayerPed(v)) - data.loc.xyz) <= 0.4 then
			triggerNotify(nil, Loc[Config.Lan].error["someone_dance"])
			canDance = false
		end
	end
	if canDance then
		loadAnimDict('mini@strip_club@pole_dance@pole_dance'..data.pole)
		local scene = NetworkCreateSynchronisedScene(vector3(data.loc.x, data.loc.y, data.loc.z+1), vector3(0.0, 0.0, 0.0), 2, false, true, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(PlayerPedId(), scene, 'mini@strip_club@pole_dance@pole_dance' .. data.pole, 'pd_dance_0' .. data.pole, 1.5, -4.0, 1, 1, 1148846080, 0)
		NetworkStartSynchronisedScene(scene)
		dancing = true
	end
	while dancing do
		if dancing then
			if IsControlJustReleased(0, 202) then
				if IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@pole_dance@pole_dance1", "pd_dance_01", 3) or
				IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@pole_dance@pole_dance2", "pd_dance_02", 3) or
				IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@pole_dance@pole_dance3", "pd_dance_03", 3) then
					dancing = false
					ClearPedTasks(PlayerPedId())
					for i = 1, 3 do unloadAnimDict("mini@strip_club@pole_dance@pole_dance"..i) end
				end
			end
		Wait(5)
		if not IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@pole_dance@pole_dance1", "pd_dance_01", 3) and
			not IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@pole_dance@pole_dance2", "pd_dance_02", 3) and
			not IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@pole_dance@pole_dance3", "pd_dance_03", 3) then
				dancing = false
				for i = 1, 3 do unloadAnimDict("mini@strip_club@pole_dance@pole_dance"..i) end
			end
		end
	end
end)

RegisterNetEvent('qb-sandybarunicorn:PvtDance', function(data)
	local canDance = true
	local dancing = false
	for k in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc.xyz, 0.6)) do
		if #(GetEntityCoords(GetPlayerPed(v)) - data.loc.xyz) <= 0.4 then
			triggerNotify(nil, Loc[Config.Lan].error["someone_dance"])
			canDance = false
		end
	end
	if canDance then
		local dancenumber = math.random(1,2)
		loadAnimDict('mini@strip_club@private_dance@part'..dancenumber)
		local scene = NetworkCreateSynchronisedScene(vector3(data.loc.x, data.loc.y, data.loc.z+1), vector3(0.0, 0.0, 0.0), 2, false, true, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(PlayerPedId(), scene, 'mini@strip_club@private_dance@part'..dancenumber, 'priv_dance_p'..dancenumber, 1.5, -4.0, 1, 1, 1148846080, 0)
		SetEntityHeading(PlayerPedId(), data.loc[4])
		NetworkStartSynchronisedScene(scene)
		dancing = true
	end
	while dancing do
		if dancing then
			if IsControlJustReleased(0, 202) then
				if IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@private_dance@part1", "priv_dance_p1", 3) or IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@private_dance@part2", "priv_dance_p2", 3) or IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@private_dance@part3", "priv_dance_p3", 3) then
					dancing = false
					ClearPedTasks(PlayerPedId())
					for i = 1, 3 do unloadAnimDict("mini@strip_club@private_dance@part"..i) end
				end
			end
			Wait(5)
			if not IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@private_dance@part1", "priv_dance_p1", 3) and
			not IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@private_dance@part2", "priv_dance_p2", 3) and
			not IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@private_dance@part3", "priv_dance_p3", 3) then
				dancing = false
				for i = 1, 3 do unloadAnimDict("mini@strip_club@private_dance@part"..i) end
			end
		end
	end
end)
if Config.MLO == "gabz" then
	Config.Poles = {
		{ coords = vector4(104.76, -1294.18, 28.25, 30.0), minZ = 28.00, maxZ = 32.85, pole = 1 },
		{ coords = vector4(108.83, -1289.02, 28.25, 30.0), minZ = 28.00, maxZ = 32.85, pole = 2 },
		{ coords = vector4(102.22, -1289.87, 28.25, 30.0), minZ = 28.00, maxZ = 32.85, pole = 3 },
	}
	Config.Dance = {
		{ coords = vector4(123.37, -1294.8, 29.69-1, 30.0), minZ= 28.29, maxZ= 29.49 },
		{ coords = vector4(120.0, -1296.83, 29.73-1, 30.0), minZ= 28.29, maxZ= 29.49 },

		{ coords = vector4(113.68, -1299.87, 29.69-1, 30.0), minZ= 28.29, maxZ= 29.49 },
		{ coords = vector4(111.23, -1304.38, 29.69-1, 30.0), minZ= 28.29, maxZ= 29.49 },
		{ coords = vector4(114.61, -1305.55, 29.77-1, 30.0), minZ= 28.29, maxZ= 29.49 },
		{ coords = vector4(113.37, -1303.06, 29.89-1, 30.0), minZ= 28.29, maxZ= 29.49 },

		{ coords = vector4(112.83, -1283.06, 28.88-1, 270.0), minZ= 27.68-1, maxZ= 28.49 },
		{ coords = vector4(117.53, -1283.03, 28.9-1, 30.0), minZ= 27.68-1, maxZ= 28.49 },
		{ coords = vector4(120.99, -1285.14, 28.68-1, 30.0), minZ= 27.68-1, maxZ= 28.49 },
		{ coords = vector4(121.97, -1286.96, 28.76-1, 30.0), minZ= 27.68-1, maxZ= 28.49 },
		{ coords = vector4(116.63, -1291.47, 28.68-1, 30.0), minZ= 27.68-1, maxZ= 28.49 },
		{ coords = vector4(115.89, -1286.76, 28.88-1, 30.0), minZ= 27.68-1, maxZ= 28.49 },
	}
elseif Config.MLO == "van" then
	Config.Poles = {
		{ coords = vector4(104.2, -1294.0, 28.26, 30.0), minZ = 28.06, maxZ = 32.85, pole = 1 },
		{ coords = vector4(102.24, -1290.63, 28.25, 30.0), minZ = 28.00, maxZ = 32.85, pole = 2 },
		{ coords = vector4(112.61, -1286.76, 27.46, 30.0), minZ = 27.30, maxZ = 31.26, pole = 3 },
	}
	Config.Dance = {
		{ coords = vector4(118.48, -1301.7, 29.27-1, 30.0), minZ= 27.68-1, maxZ= 28.49 },
		{ coords = vector4(116.36, -1302.87, 29.27-1, 30.0), minZ= 27.68-1, maxZ= 28.49 },
		{ coords = vector4(114.2, -1304.06, 29.27-1, 30.0), minZ= 27.68-1, maxZ= 28.49 },
		{ coords = vector4(112.45, -1305.3, 29.27-1, 30.0), minZ= 27.68-1, maxZ= 28.49 },
		{ coords = vector4(111.04, -1302.68, 29.27-1, 30.0), minZ= 27.68-1, maxZ= 28.49 },
		{ coords = vector4(112.96, -1301.75, 29.27-1, 30.0), minZ= 27.68-1, maxZ= 28.49 },
		{ coords = vector4(114.86, -1300.71, 29.27-1, 30.0), minZ= 27.68-1, maxZ= 28.49 },
	}
end

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	for k in pairs(Poles) do exports['qb-target']:RemoveZone(k) end
end)