--[[
    troll.rip 1.0.0
    Type: Installer

    by: @stav
    Forever always will be free, and undetected.
]]

-- Functions troll.rip needs to work
local function assert(func, msg, cfunc) -- Func (function), Msg (warn/err string), cfunc (custom function)
    if cfunc and not func then
        warn(msg)
        getgenv().func = cfunc
    end
    if not func then
        error(msg, 2)
        return
    end
end

assert(cloneref, 'Where is the UD-ness?', function(obj)
    return obj
end)

assert(firetouchinterest, 'Bad exec lol', function(plr: Instance, item: Instance, tog: number): Instance -- taken off of kool.aid, ik
    task.spawn(function()
        if tog == 0 or tog > 1 then return end

        local suc, res = pcall(function()
            if not item:FindFirstChildOfClass('TouchTransmitter') then
                return error('Item does not have a TouchTransmitter: '..item, 2)
            end
        end)

        if suc then
            local collision, cframe = item.CanCollide, item.CFrame
            item.CanCollide = false
            item.CFrame = plr.CFrame
            task.wait()
            item.CFrame = cframe
            item.CanCollide = collision

            -- checks to make sure they go somewhere (mhm!! soo good guys)
            if item.CFrame ~= cframe then
                item.CFrame = cframe
            end
            if item.CanCollide ~= collision then
                item.CanCollide = collision
            end
        end
    end)
end)

assert(identifyexecutor, 'Super horrible executor', function()
    return 'troll.rip 1.0.0'
end)

assert(isfile, 'Learn to make functions and maybe I will forgive you', function(file)
    local suc, res = pcall(readfile, file)
    return suc and res ~= nil and res ~= ''
end)

assert(delfile, 'Learn to make functions and maybe I will forgive you', function(file)
    writefile(file, '')
end)

assert(loadstring, 'Learn to make functions and maybe I will forgive you', function(path)
    local function randomString(length)
        local result = ''
        for i = 1, length do
            result = result..string.char(math.random(97, 122))
        end
        return result
    end
    local str = randomString(10)

    if not isfile(str) then
        writefile(str, path)
        loadfile(str)()
        task.wait(0.06)
        delfile(str)
    end
end)

assert(fireproximityprompt, 'Horrific executor. Run sum MoreUNC or sum shi')

-- Actual installer lolz!
local api = 'https://api.github.com/repos/sstvskids/troll.rip/contents/'
local httpService = cloneref(game:GetService('HttpService'))

local folders = {'games', 'libraries'}
for _,v in {'troll.rip', 'troll.rip/themes', 'troll.rip/configs'} do
    if not isfolder(v) then
        task.spawn(makefolder, v)
    end
end

for _, v in httpService:JSONDecode(game:HttpGet(api)) do
    if v.type == 'dir' then
        if not isfolder('troll.rip/'..v.path) then
            task.spawn(makefolder, 'troll.rip/'..v.path)
        end
    elseif v.type == 'file' then
        if isfile('troll.rip/'..v.path) then
            delfile('troll.rip/'..v.path)
        end
        task.spawn(writefile, 'troll.rip/'..v.path, game:HttpGet(v.download_url))
    end
end

for _,v in folders do
    for _, i in httpService:JSONDecode(game:HttpGet(api..v)) do
        if i.type == 'dir' then
            if not isfolder('troll.rip/'..i.path) then
                task.spawn(makefolder, 'troll.rip/'..i.path)
            end
        elseif i.type == 'file' then
            if isfile('troll.rip/'..i.path) then
                delfile('troll.rip/'..i.path)
            end
            task.spawn(writefile, 'troll.rip/'..i.path, game:HttpGet(i.download_url))
        end
    end
end

print('troll.rip omega lolz')
return loadfile('troll.rip/main.lua')()