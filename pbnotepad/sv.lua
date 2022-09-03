--[[ Here you can configure automatic removal of notes from your database at startup of script
If removal_enabled is set to false nothing will be deleted
Value should be in mysql INTERVAL format
Reference this: https://www.mysqltutorial.org/mysql-interval/
or this: https://www.javatpoint.com/mysql-interval ]]

local removal_enabled = false
local removal_interval = '6 MONTH'

--[[ Here ends the configuration ]]

if (removal_enabled) then
    MySQL.query.await('DELETE FROM pbnotepad WHERE created < (NOW() - INTERVAL '..removal_interval..');')
end

local charset = "qwertyuiopasdfghjklzxcvbnm1234567890"
function randomString(length)
	local ret = {}
	local r
	for i = 1, length do
		r = math.random(1, #charset)
		table.insert(ret, charset:sub(r, r))
	end
	return table.concat(ret)
end

RegisterNetEvent('pbnotepad:giveNote')
AddEventHandler('pbnotepad:giveNote', function(txt)
    local i = randomString(32)
    MySQL.insert('INSERT INTO pbnotepad (id, content, created) VALUES (?, ?, NOW())', {i, txt}, function(x)
        print(x)
    end)

    local ply = source
    exports.ox_inventory:AddItem(ply, 'pb_note', 1, {id = i})
end)

lib.callback.register('pbnotepad:getNoteContent', function(source,im)
    local result = MySQL.query.await('SELECT *  FROM pbnotepad WHERE id = ? LIMIT 1', {im})
    local m = ''
    if (result[1] ~= nil) then
        m = result[1].content
    else
        m = ''
    end
    
    return m
end)