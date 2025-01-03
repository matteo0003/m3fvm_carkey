RegisterCommand("carkey", function()
	local vehicle <const> = GetVehiclePedIsIn(PlayerPedId(), false)
	local plate <const> = GetVehicleNumberPlateText(vehicle)

	if plate == nil then return end

	TriggerServerEvent("m3fvm_carkey:give", GetPlayerServerId(PlayerId()), plate)
end)

local get_item_count = function(item_name, metadata)
	local count = 0
	local items <const> = exports.ox_inventory:Search("slots", item_name)

	for _, item in pairs(items) do
		local match = false
        
		for key, value in pairs(metadata) do
			if item.metadata[key] == value then
				match = true
				break
			end
		end

		if match then
			count = count + item.count
		end
	end
    
	return count
end

local play_animations = function()
	local ped <const> = PlayerPedId()

	local anim_dict <const> = "anim@mp_player_intmenu@key_fob@"
	lib.requestAnimDict(anim_dict)
    
	TaskPlayAnim(ped, anim_dict, "fob_click", 3.0, 3.0, -1, 48, 0.0, false, false, false)
    
	local model_hash <const> = GetHashKey("lr_prop_carkey_fob")
	RequestModel(model_hash)

	while not HasModelLoaded(model_hash) do
		Citizen.Wait(0)
	end

	local coords <const> = GetEntityCoords(ped)
	local prop <const> = CreateObject(model_hash, coords.x, coords.y, coords.z, true, true, true)
	AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, 57005), 0.14, 0.03, -0.01, 24.0, -152.0, 164.0, true, true, false, false, 1, true)

	Citizen.Wait(1000)
	DeleteObject(prop)
	ClearPedTasks(ped)
end

local turn_headlights = function(vehicle)
	for _ = 1, 2 do
		SetVehicleLights(vehicle, 2)
		Wait(150)
		SetVehicleLights(vehicle, 0)
		Wait(150)
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustPressed(0, Config.Control) then
			local coords <const> = GetEntityCoords(PlayerPedId())
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            
			if vehicle == 0 then
				vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.000, 0, 70)
			end
            
			local plate <const> = GetVehicleNumberPlateText(vehicle)

			local count <const> = get_item_count("m3fvm_carkey", {
				label = plate,
				plate = plate,
			})

			if count > 0 then
				local status <const> = GetVehicleDoorLockStatus(vehicle)
    
				if status == 1 then
					SetVehicleDoorsLocked(vehicle, 10)
				else
					SetVehicleDoorsLocked(vehicle, 1)
				end
    
				PlayVehicleDoorOpenSound(vehicle, 0)
				Citizen.CreateThread(play_animations)
				Citizen.CreateThread(function()
					turn_headlights(vehicle)
				end)
			end
		end
	end
end)