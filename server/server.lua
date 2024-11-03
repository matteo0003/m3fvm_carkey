RegisterNetEvent("carkey", function(source)
	local ped <const> = GetPlayerPed(source)
	local coords <const> = GetEntityCoords(ped)
	local vehicle <const> = lib.getClosestVehicle(coords, 5.000)
	local plate <const> = GetVehicleNumberPlateText(vehicle)

	if plate == nil then return end

	TriggerServerEvent("m3fvm_carkey:give", source, plate)
end)

RegisterNetEvent("m3fvm_carkey:give", function(source, plate)
	exports.ox_inventory:AddItem(source, "m3fvm_carkey", 1, {
		label = plate,
		plate = plate,
	})
end)