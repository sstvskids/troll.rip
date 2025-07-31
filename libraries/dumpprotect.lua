--[[
    troll.rip 1.0.0
    type: Protection

    by: @stav

    Protects against the threaded dumper, and a few others that haven't implemented protection against while and repeat loops.
    Incase if we need it due to pasters using this code without permission, but so far not ;)
]]

local shared = getfenv()
shared.trollprotect = true

local function randomString(length)
    local result = ''
    for i = 1, length do
        result = result..string.char(math.random(97, 122))
    end
    return result
end

shared.blackstring = randomString(99)

local troll, troll2
task.spawn(function()
    repeat
        troll = randomString(22)
        task.wait()
    until shared.trollprotect == false
end)

print(troll)

task.spawn(function()
    while shared.blackstring ~= nil and shared.trollprotect == true do
        task.wait()
    end
end)

task.spawn(function()
    while shared.blackstring ~= nil and shared.trollprotect == true do
        troll2 = randomString(22)
        task.wait()
    end
end)

print(troll2)