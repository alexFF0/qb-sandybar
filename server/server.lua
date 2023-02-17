local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Server:UpdateObject', function() if source ~= '' then return false end	QBCore = exports['qb-core']:GetCoreObject() end)

AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	for k, v in pairs(Crafting) do for i = 1, #v do
			for l, b in pairs(v[i]) do if not QBCore.Shared.Items[l] then print("^5Debug^7: ^6Crafting^7: ^2Missing Item from ^4QBCore^7.^4Shared^7.^4Items^7: '^6"..l.."^7'") end
				for j in pairs(b) do if not QBCore.Shared.Items[j] then print("^5Debug^7: ^6Crafting^7: ^2Missing Item from ^4QBCore^7.^4Shared^7.^4Items^7: '^6"..j.."^7'") end end end end end
	for i = 1, #Config.DrinkItems.items do
		if not QBCore.Shared.Items[Config.DrinkItems.items[i].name] then print("^5Debug^7: ^6Store^7: ^2Missing Item from ^4QBCore^7.^4Shared^7.^4Items^7: '^6"..Config.DrinkItems.items[i].name.."^7'") end
	end
	for i = 1, #Config.FoodItems.items do
		if not QBCore.Shared.Items[Config.FoodItems.items[i].name] then print("^5Debug^7: ^6Store^7: ^2Missing Item from ^4QBCore^7.^4Shared^7.^4Items^7: '^6"..Config.FoodItems.items[i].name.."^7'") end
	end
	if not QBCore.Shared.Jobs["sandybar"] then print("^5Debug^7: ^1Error^7: ^2Job role not found ^7- '^6sandybar^7'") end
end)

--Consumables
--CreateThread(function()
	--local cocktails = { "gin", "rum", "amaretto", "amarettosour", "bellini", "bloodymary", "cosmopolitan", "longisland", "margarita", "pinacolada", "sangria", "screwdriver", "strawdaquiri", "strawmargarita", "midori", "prosecco", "tequila", "triplsec" }
   -- for _, v in pairs(cocktails) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('qb-sandybarunicorn:client:DrinkAlcohol', source, item.name) end) end
--
--	local beers = { "ambeer", "dusche", "logger", "pisswasser", "pisswasser2", "pisswasser3" }
--for _, v in pairs(beers) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('qb-sandybarunicorn:client:DrinkAlcohol', source, item.name) end) end

--	local drinks = { "sprunk", "sprunklight", "ecola", "ecolalight", "cranberry", "pinejuice" }
--    for _, v in pairs(drinks) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('qb-sandybarunicorn:client:Drink', source, item.name) end) end

--	local food = { "chocolate", "vusliders", "vutacos", "nplate", "tots", "nachos", "crisps" }
 --   for _,v in pairs(food) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('qb-sandybarunicorn:client:Eat', source, item.name) end) end
--end)

QBCore.Functions.CreateCallback('qb-sandybarunicorn:GetCash', function(source, cb)
	cb(QBCore.Functions.GetPlayer(source).Functions.GetMoney("cash"))
end)
RegisterServerEvent("qb-sandybarunicorn:StrepTip", function()
	QBCore.Functions.GetPlayer(source).Functions.RemoveMoney("cash", Config.TipCost)
end)

---Crafting
RegisterServerEvent('qb-sandybarunicorn:Crafting:GetItem', function(ItemMake, craftable)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	--This grabs the table from client and removes the item requirements
	local amount = 1
	if craftable then
		if craftable["amount"] then amount = craftable["amount"] end
		for k, v in pairs(craftable[ItemMake]) do TriggerEvent("qb-sandybarunicorn:server:toggleItem", false, tostring(k), v, src) end
	end
	--This should give the item, while the rest removes the requirements
	TriggerEvent("qb-sandybarunicorn:server:toggleItem", true, ItemMake, amount, src)
end)

-- Server Side Built in DJ Booth stuff
local xSound = exports.xsound
RegisterNetEvent('qb-sandybarunicorn:server:playMusic', function(song, zoneNum)
    local src = source
	local Booth = Config.Locations[zoneNum].Booth
	local zoneLabel = Config.Locations[zoneNum].job..zoneNum
    xSound:PlayUrlPos(-1, zoneLabel, song, Booth.DefaultVolume, GetEntityCoords(GetPlayerPed(src)))
    xSound:Distance(-1, zoneLabel, Booth.radius)
    Config.Locations[zoneNum].Booth.playing = true
    TriggerClientEvent('qb-sandybarunicorn:client:playMusic', src, { zone = zoneNum })
end)
RegisterNetEvent('qb-sandybarunicorn:server:stopMusic', function(data)
    local src = source
	local zoneLabel = Config.Locations[data.zoneNum].job..data.zoneNum
    if Config.Locations[data.zoneNum].Booth.playing then
        Config.Locations[data.zoneNum].Booth.playing = false
        xSound:Destroy(-1, zoneLabel)
    end
    TriggerClientEvent('qb-sandybarunicorn:client:playMusic', src, { zone = data.zoneNum })
end)
RegisterNetEvent('qb-sandybarunicorn:server:pauseMusic', function(data)
    local src = source
	local zoneLabel = Config.Locations[data.zoneNum].job..data.zoneNum
    if Config.Locations[data.zoneNum].Booth.playing then
        Config.Locations[data.zoneNum].Booth.playing = false
        xSound:Pause(-1, zoneLabel)
    end
    TriggerClientEvent('qb-sandybarunicorn:client:playMusic', src, { zone = data.zoneNum })
end)
RegisterNetEvent('qb-sandybarunicorn:server:resumeMusic', function(data)
    local src = source
	local zoneLabel = Config.Locations[data.zoneNum].job..data.zoneNum
    if not Config.Locations[data.zoneNum].Booth.playing then
        Config.Locations[data.zoneNum].Booth.playing = true
        xSound:Resume(-1, zoneLabel)
    end
    TriggerClientEvent('qb-sandybarunicorn:client:playMusic', src, { zone = data.zoneNum })
end)
RegisterNetEvent('qb-sandybarunicorn:server:changeVolume', function(volume, zoneNum)
    local src = source
	local Booth = Config.Locations[zoneNum].Booth
	local zoneLabel = Config.Locations[zoneNum].job..zoneNum
    if not tonumber(volume) then return end
    if Config.Locations[zoneNum].Booth.playing then xSound:setVolume(-1, zoneLabel, volume) end
    TriggerClientEvent('qb-sandybarunicorn:client:playMusic', src, { zone = zoneNum })
end)

RegisterNetEvent('qb-sandybarunicorn:server:toggleItem', function(give, item, amount, newsrc)
	local src = newsrc or source
	if give == 0 or give == false then
		if HasItem(src, item, amount or 1) then -- check if you still have the item
			if QBCore.Functions.GetPlayer(src).Functions.RemoveItem(item, amount or 1) then
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount or 1)
				if Config.Debug then print("^5Debug^7: ^1Removing ^2from Player^7(^2"..src.."^7) '^6"..QBCore.Shared.Items[item].label.."^7(^2x^6"..(amount or "1").."^7)'") end
			end
		else TriggerEvent("qb-sandybarunicorn:server:DupeWarn", item, src) end -- if not boot the player
	else
		if QBCore.Functions.GetPlayer(src).Functions.AddItem(item, amount or 1) then
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount or 1)
			if Config.Debug then print("^5Debug^7: ^4Giving ^2Player^7(^2"..src.."^7) '^6"..QBCore.Shared.Items[item].label.."^7(^2x^6"..(amount or "1").."^7)'") end
		end
	end
end)

RegisterNetEvent("qb-sandybarunicorn:server:DupeWarn", function(item, newsrc)
	local src = newsrc or source
	local P = QBCore.Functions.GetPlayer(src)
	print("^5DupeWarn: ^1"..P.PlayerData.charinfo.firstname.." "..P.PlayerData.charinfo.lastname.."^7(^1"..tostring(src).."^7) ^2Tried to remove item ^7('^3"..item.."^7')^2 but it wasn't there^7")
	DropPlayer(src, "Kicked for attempting to duplicate items")
	print("^5DupeWarn: ^1"..P.PlayerData.charinfo.firstname.." "..P.PlayerData.charinfo.lastname.."^7(^1"..tostring(src).."^7) ^2Dropped from server for item duplicating^7")
end)

function HasItem(source, items, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end
    local isTable = type(items) == 'table'
    local isArray = isTable and table.type(items) == 'array' or false
    local totalItems = #items
    local count = 0
    local kvIndex = 2
    if isTable and not isArray then
        totalItems = 0
        for _ in pairs(items) do totalItems += 1 end
        kvIndex = 1
    end
    if isTable then
	if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Checking if player^7(^6"..source.."^7)^2 has items^7") end
        for k, v in pairs(items) do
            local itemKV = {k, v}
            local item = Player.Functions.GetItemByName(itemKV[kvIndex])
            if item and ((amount and item.amount >= amount) or (not isArray and item.amount >= v) or (not amount and isArray)) then
                count += 1
            end
        end
        if count == totalItems then
			if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Items FOUND^7") end
            return true
        end
    else -- Single item as stringHasItem(v, 1)
		if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Checking if player^7(^6"..source.."^7)^2 has items^7") end
		local item = Player.Functions.GetItemByName(items)
        if item and (not amount or (item and amount and item.amount >= amount)) then
            return true
        end
    end
	if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Items Not FOUND^7") end
    return false
end

AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
	for i = 1, #Config.Locations do
		if Config.Locations[i].Booth.playing then
			local zoneLabel = Config.Locations[i].job..i
			xSound:Destroy(-1, zoneLabel)
		end
	end
end)