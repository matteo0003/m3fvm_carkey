RegisterNetEvent("m3fvm_carkey:give", function(source, plate)
	exports.ox_inventory:AddItem(source, "m3fvm_carkey", 1, {
		label = plate,
		plate = plate,
	})
end)
