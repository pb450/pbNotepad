RegisterNetEvent('pbnotepad:createNoteAtInventory', function(inventory,text)
    exports.ox_inventory:AddItem(inventory, 'pb_note', 1, {content = text})
end)

RegisterNetEvent('pbnotepad:giveNote')
AddEventHandler('pbnotepad:giveNote', function(txt)
    TriggerEvent('pbnotepad:createNoteAtInventory', source, txt)
end)