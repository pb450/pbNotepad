RegisterNUICallback('action', function(data, cb)
    if data.action == 'createNote' then
        if data.content ~= '' then
            local txt = data.content;

            TriggerServerEvent("pbnotepad:giveNote", txt)
        end
    end

    if data.action == 'hide' then
        SetNuiFocus(false, false)
    end

    cb('ok')
end)

exports('read', function(data,slot)
    local id = slot.metadata.id

    lib.callback('pbnotepad:getNoteContent', false, function(ctx)
        SendNUIMessage({action = 'open', text = ctx})
        SetNuiFocus(true, true)
    end, id)
end)

exports('edit', function(data, slot)
    SendNUIMessage({action = 'edit'})
    SetNuiFocus(true, true)
end)