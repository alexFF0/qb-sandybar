local QBCore = exports['qb-core']:GetCoreObject()

local vseat = nil
local sitting = false
local Chairs = {}

CreateThread(function()
	for k, v in pairs(Config.Chairs) do
		Chairs["UniChair"..k] =
		exports['qb-target']:AddBoxZone("UniChair"..k, v.coords.xyz, 0.7, 0.7, { name="UniChair"..k, heading = v.coords.w, debugPoly=Config.Debug, minZ = v.coords.z-1.2, maxZ = v.coords.z+0.1, },
			{ options = { { event = "qb-sandybarunicorn:Chair", icon = "fas fa-chair", label = Loc[Config.Lan].info["Sit Down"], loc = v.coords, stand = v.stand }, },
				distance = 2.2
		})
	end
end)

RegisterNetEvent('qb-sandybarunicorn:Chair', function(data)
	local canSit = true
	local sitting = false
	local ped = PlayerPedId()
	for _, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc.xyz, 0.6)) do
		local dist = #(GetEntityCoords(GetPlayerPed(v)) - data.loc.xyz)
		if dist <= 0.4 then triggerNotify(nil, Loc[Config.Lan].error["someone_sitting"]) canSit = false end
	end
	if canSit then
		if not IsPedHeadingTowardsPosition(ped, data.loc.xyz, 20.0) then TaskTurnPedToFaceCoord(ped, data.loc.xyz, 1500) Wait(1500)	end
		if #(data.loc.xyz - GetEntityCoords(PlayerPedId())) > 1.5 then TaskGoStraightToCoord(ped, data.loc.xyz, 0.5, 1000, 0.0, 0) Wait(1100) end
		TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.loc[4], 0, 1, true)
		vseat = data.stand
		sitting = true
	end
	while sitting do
		if sitting then
			if IsControlJustReleased(0, 202) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				ClearPedTasks(ped)
				if vseat then SetEntityCoords(ped, vseat) end
				vseat = nil
			end
		end
		Wait(5) if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = false end
	end
end)

if Config.MLO == "gabz" then
	Config.Chairs = {
		--BAR STOOLS
		{ coords = vector4(126.39, -1282.71, 29.27+0.2, 300.0), stand = vector3(126.17, -1282.86, 29.27-0.5) },
		{ coords = vector4(127.23, -1284.14, 29.27+0.2, 300.0), stand = vector3(126.99, -1284.28, 29.27-0.5) },
		{ coords = vector4(127.89, -1285.33, 29.27+0.2, 300.0), stand = vector3(127.69, -1285.48, 29.27-0.5) },
		{ coords = vector4(128.57, -1286.48, 29.27+0.2, 300.0), stand = vector3(128.34, -1286.61, 29.27-0.5) },
		{ coords = vector4(129.22, -1287.62, 29.27+0.2, 300.0), stand = vector3(129.01, -1287.77, 29.27-0.5) },
		--MAIN BOOTHS
		{ coords = vector4(124.49, -1293.7, 29.27, 120.0) },
		{ coords = vector4(124.99, -1294.55, 29.27, 120.0) },
		{ coords = vector4(124.62, -1295.98, 29.29, 30.0) },
		{ coords = vector4(123.75, -1296.48, 29.29, 30.0) },
		{ coords = vector4(122.31, -1296.08, 29.27, 300.0) },
		{ coords = vector4(121.82, -1295.23, 29.27, 300.0) },

		{ coords = vector4(121.09, -1295.67, 29.27, 120.0) },
		{ coords = vector4(121.58, -1296.52, 29.27, 120.0) },
		{ coords = vector4(121.24, -1297.95, 29.27, 30.0) },
		{ coords = vector4(120.36, -1298.45, 29.27, 30.0) },
		{ coords = vector4(118.92, -1298.05, 29.27, 300.0) },
		{ coords = vector4(118.44, -1297.21, 29.27, 300.0) },
		--DANCEFLOOR
		{ coords = vector4(123.42, -1289.31, 28.26, 30.0) },
		{ coords = vector4(124.23, -1288.5, 28.26, 75.0) },
		{ coords = vector4(123.96, -1287.38, 28.26, 120.0) },
		{ coords = vector4(123.14, -1286.66, 28.26, 165.0) },

		{ coords = vector4(121.72, -1286.38, 28.26, 30.0) },
		{ coords = vector4(122.48, -1285.56, 28.26, 75.0) },
		{ coords = vector4(122.25, -1284.46, 28.26, 120.0) },
		{ coords = vector4(121.45, -1283.74, 28.26, 165.0) },
		{ coords = vector4(120.36, -1283.98, 28.26, 210.0) },

		{ coords = vector4(119.44, -1282.63, 28.26, 100.0) },
		{ coords = vector4(119.05, -1281.76, 28.26, 130.0) },
		{ coords = vector4(118.26, -1281.18, 28.26, 160.0) },
		{ coords = vector4(117.33, -1281.01, 28.26, 180.0) },
		{ coords = vector4(116.41, -1281.34, 28.26, 210.0) },
		{ coords = vector4(115.75, -1282.07, 28.26, 240.0) },
		{ coords = vector4(115.49, -1282.99, 28.26, 270.0) },
		{ coords = vector4(115.73, -1283.97, 28.26, 300.0) },

		{ coords = vector4(111.3, -1281.78, 28.26, 229.0) },
		{ coords = vector4(112.11, -1281.24, 28.26, 200.0) },
		{ coords = vector4(113.06, -1281.12, 28.26, 170.0) },
		{ coords = vector4(113.98, -1281.51, 28.26, 140.0) },
		{ coords = vector4(114.59, -1282.29, 28.26, 110.0) },
		{ coords = vector4(114.78, -1283.21, 28.26, 90.0) },
		{ coords = vector4(114.51, -1284.14, 28.26, 60.0) },
		{ coords = vector4(113.87, -1284.83, 28.26, 30.0) },

		{ coords = vector4(117.52, -1285.67, 28.26, 125.0) },
		{ coords = vector4(117.87, -1286.57, 28.26, 98.0) },
		{ coords = vector4(117.74, -1287.52, 28.26, 70.0) },
		{ coords = vector4(117.17, -1288.33, 28.26, 30.0) },
		{ coords = vector4(116.3, -1288.79, 28.26, 10.0) },
		{ coords = vector4(115.32, -1288.73, 28.26, 345.0) },

		{ coords = vector4(117.32, -1292.84, 28.31, 30.0) },
		{ coords = vector4(116.22, -1293.14, 28.36, 345.0) },
		{ coords = vector4(115.4, -1292.33, 28.26, 300.0) },
		--CENTER
		{ coords = vector4(108.2, -1293.5, 28.26, 30.0) },
		{ coords = vector4(109.9, -1292.53, 28.26, 30.0) },
		{ coords = vector4(111.75, -1290.85, 28.26, 70.0) },
		{ coords = vector4(111.99, -1288.48, 28.26, 100.0) },
		{ coords = vector4(110.72, -1286.64, 28.26, 145.0) },
		{ coords = vector4(108.48, -1286.0, 28.26, 180.0) },
		{ coords = vector4(106.37, -1286.72, 28.26, 205.0) },
		{ coords = vector4(104.72, -1287.6, 28.26, 210.0) },

		{ coords = vector4(116.16, -1303.23, 29.29, 120.0) },
		{ coords = vector4(116.38, -1304.3, 29.29, 75.0) },
		{ coords = vector4(115.6, -1305.15, 29.29, 30.0) },
		{ coords = vector4(113.81, -1306.22, 29.29, 30.0) },
		{ coords = vector4(112.7, -1306.46, 29.29, 345.0) },
		{ coords = vector4(111.86, -1305.69, 29.29, 300.0) },
		{ coords = vector4(110.43, -1303.19, 29.29, 300.0) },
		{ coords = vector4(110.17, -1302.06, 29.29, 255.0) },
		{ coords = vector4(110.94, -1301.22, 29.29, 210.0) },
		{ coords = vector4(111.8, -1300.72, 29.29, 210.0) },
		{ coords = vector4(112.66, -1300.21, 29.29, 210.0) },

		{ coords = vector4(98.85, -1290.32, 29.26, 120.0) },
		{ coords = vector4(98.23, -1289.37, 29.26, 120.0) },
		{ coords = vector4(95.14, -1293.57, 29.26, 321.0), stand = vector3(94.65, -1292.76, 29.26-0.5) },
	}
elseif Config.MLO == "van" then
	Config.Chairs = {
		--BAR
		{ coords = vector4(125.05, -1282.64, 29.28, 121.0), stand = vector3(123.73, -1282.59, 29.28-0.5) },
		{ coords = vector4(123.39, -1283.58, 29.29, 299.0), stand = vector3(123.73, -1282.59, 29.28-0.5) },
		{ coords = vector4(124.96, -1284.63, 29.29, 122.0) },
		{ coords = vector4(125.31, -1285.84, 29.29, 75.0), stand = vector3(124.63, -1286.36, 29.29-0.5) },
		{ coords = vector4(126.38, -1287.04, 29.28, 131.0), stand = vector3(125.27, -1287.11, 29.29-0.5) },
		{ coords = vector4(126.11, -1288.57, 29.29, 33.0), stand =  vector3(126.55, -1287.89, 29.29-0.5) },

		--MAIN BOOTHS
		{ coords = vector4(124.8, -1294.34, 29.27, 120.0) },
		{ coords = vector4(124.44, -1295.68, 29.27, 30.0) },
		{ coords = vector4(123.72, -1296.11, 29.27, 30.0) },
		{ coords = vector4(122.38, -1295.72, 29.27, 300.0) },

		{ coords = vector4(121.55, -1296.23, 29.27, 120.0) },
		{ coords = vector4(121.2, -1297.53, 29.27, 30.0) },
		{ coords = vector4(120.47, -1297.95, 29.27, 30.0) },
		{ coords = vector4(119.16, -1297.61, 29.27, 300.0) },

		--DOOR Guard
		{ coords = vector4(118.0, -1296.22, 29.27, 330.0) },

		--BACK ROOM
		{ coords = vector4(119.19, -1302.77, 29.27, 30.0) },
		{ coords = vector4(117.04, -1304.01, 29.27, 30.0) },
		{ coords = vector4(114.96, -1305.23, 29.27, 30.0) },
		{ coords = vector4(113.14, -1306.27, 29.27, 30.0) },
		{ coords = vector4(110.54, -1301.69, 29.27, 210.0) },
		{ coords = vector4(112.32, -1300.68, 29.27, 210.0) },
		{ coords = vector4(114.21, -1299.59, 29.27, 210.0) },

		--DANCEFLOOR
		{ coords = vector4(123.72, -1288.85, 28.26, 25.0) },
		{ coords = vector4(123.07, -1286.63, 28.26, 112.0) },
		{ coords = vector4(122.19, -1285.17, 28.27, 131.0) },
		{ coords = vector4(121.41, -1283.82, 28.28, 130.0) },
		{ coords = vector4(119.87, -1283.71, 28.28, 89.0) },
		{ coords = vector4(118.43, -1281.07, 28.27, 143.0) },
		--LEFT
		{ coords = vector4(106.48, -1297.09, 28.26, 300.0) },
		{ coords = vector4(109.34, -1295.45, 28.26, 81.0) },
		{ coords = vector4(110.24, -1294.89, 28.26, 297.0) },
		{ coords = vector4(113.05, -1293.3, 28.26, 89.0) },

		--CENTER LEFT
		{ coords = vector4(109.11, -1292.4, 28.26, 30.0), stand = vector3(109.42, -1292.83, 28.26-0.5) },
		{ coords = vector4(110.19, -1291.79, 28.26, 30.0), stand = vector3(110.38, -1292.28, 28.26-0.5) },
		{ coords = vector4(111.45, -1291.08, 28.26, 30.0), stand = vector3(111.73, -1291.48, 28.26-0.5) },

		--CENTER MIDDLE
		{ coords = vector4(116.89, -1288.53, 28.26, 90.0) },
		{ coords = vector4(116.13, -1286.46, 28.26, 112.0) },
		{ coords = vector4(115.1, -1284.65, 28.26, 118.0) },
		{ coords = vector4(113.83, -1282.91, 28.27, 142.0) },

		--RIGHT
		{ coords = vector4(101.07, -1286.3, 28.26, 294.0) },
		{ coords = vector4(103.31, -1284.89, 28.26, 208.0) },
		{ coords = vector4(104.79, -1284.2, 28.26, 288.0) },
		{ coords = vector4(107.15, -1282.83, 28.26, 165.0) },

		--CENTER RIGHT
		{ coords = vector4(104.87, -1287.78, 28.26, 180.0) },
		{ coords = vector4(106.67, -1286.69, 28.26, 211.0) },
		{ coords = vector4(108.34, -1285.69, 28.26, 232.0) },

		{ coords = vector4(95.14, -1293.57, 29.26, 321.0), stand = vector3(94.65, -1292.76, 29.26-0.5) },
	}
end

AddEventHandler('onResourceStop', function(r) if r == GetCurrentResourceName() then for k in pairs(Chairs) do exports['qb-target']:RemoveZone(k) end end end)