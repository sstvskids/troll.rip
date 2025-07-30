--[[
    Washiez Utilities
    og: @Servant
    rewritten by: @stav

    This version is undetected (somehow)
]]

repeat task.wait() until game:IsLoaded()

local utils = {
    funcs = {},
    cars = {}
}

local function assert(func, msg, cfunc)
    if cfunc and not func then
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

assert(fireproximityprompt, 'Bad exec lolz: get Volcano @ volcano.wtf or Nucleus @ nucleus.rip') -- i'm not making fixes for these

local replicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
local playersService = cloneref(game:GetService('Players'))
local workspace = cloneref(game:GetService('Workspace'))

local suc, res = pcall(require, replicatedStorage.GasStation:WaitForChild('MaxFuel'))
if suc then
    utils.cars = res
else
    utils.cars = {
        ["SUV"] = 1200,
        ["Striped SUV"] = 1250,
        ["Van"] = 1350,
        ["Striped Van"] = 1400,
        ["Jeep"] = 1300,
        ["Sedan"] = 1300,
        ["Camo Jeep"] = 1350,
        ["Striped Sedan"] = 1350,
        ["Pickup Truck"] = 1300,
        ["Foiled Pickup Truck"] = 1350,
        ["Dune Buggy"] = 1100,
        ["Camo Dune Buggy"] = 1200,
        ["Sports Car"] = 1000,
        ["Striped Sports Car"] = 1050,
        ["Painted Sports Car"] = 1050,
        ["Supercar"] = 1000,
        ["Striped Supercar"] = 1050,
        ["Police Car"] = 1250
    } -- I'll improve the table later, rn focusing on the Utilities.
end

getgenv().getVehicle = function(vehicle, type)
    local name = string.split(vehicle.Name, '-')
    return name[type]
end