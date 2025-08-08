--[[
    troll.rip 1.0.0
    type: Utils

    og: @Servant
    rewritten by: @stav

    Rewritten and optimized for troll.rip's needs.
]]

repeat task.wait() until game:IsLoaded()

local utils = {
    funcs = {},
    cars = {}
}

local cloneref = cloneref or function(obj)
    return obj
end

local replicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
local playersService = cloneref(game:GetService('Players'))
local workspace = cloneref(game:GetService('Workspace'))

local lplr = playersService.LocalPlayer

local suc, res = pcall(require, replicatedStorage.GasStation:WaitForChild('MaxFuel'))
utils.cars = suc == true and type(res) == 'table' and res or {
    ['SUV'] = 1200,
    ['Striped SUV'] = 1250,
    ['Van'] = 1350,
    ['Striped Van'] = 1400,
    ['Jeep'] = 1300,
    ['Sedan'] = 1300,
    ['Camo Jeep'] = 1350,
    ['Striped Sedan'] = 1350,
    ['Pickup Truck'] = 1300,
    ['Foiled Pickup Truck'] = 1350,
    ['Dune Buggy'] = 1100,
    ['Camo Dune Buggy'] = 1200,
    ['Sports Car'] = 1000,
    ['Striped Sports Car'] = 1050,
    ['Painted Sports Car'] = 1050,
    ['Supercar'] = 1000,
    ['Striped Supercar'] = 1050,
    ['Police Car'] = 1250
}

--[[
    Anticheat Functions
]]

utils.funcs.disableAC = function()
    task.spawn(function()
        for i,v in game:GetDescendants() do
            if v:IsA('Folder') and v.Name == 'AE' then
                v:Destroy()
            end
            if v:IsA('LocalScript') and v.Name == 'AntiExploit' then
                v:Destroy()
            end
        end
    end)
end

--[[
    Vehicle Functions
]]

utils.funcs.getVehicleType = function(vehicle, type)
    local name = string.split(vehicle.Name, '-')
    return name[type]
end

utils.funcs.waitForVehicle = function(vehicle)
    repeat task.wait() until #vehicle:GetDescendants() >= utils.cars[utils.funcs.getVehicleType(vehicle, 2)]
end

utils.funcs.getVehicle = function(target)
    target = target or lplr
    for _, v in workspace.SpawnedCars:GetChildren() do
        if string.find(v.Name, target.Name) then
            return v
        end
    end

    return 'N/A'
end

utils.funcs.spawnVehicle = function(type)
    replicatedStorage.CarSpawnSystem.RemoteEvents.CarSystem:InvokeServer('Spawn', type, false)
end

--[[
    Distance Functions
]]

utils.funcs.getNearestPlayer = function()
    local nearest, nearestDistance = nil, math.huge
    for _, v in playersService:GetPlayers() do
        if v ~= lplr then
            local distance = (lplr.Character.PrimaryPart.Position - v.Character.PrimaryPart.Position).Magnitude
            if distance < nearestDistance then
                nearest = v
                nearestDistance = distance
            end
        end
    end

    return nearest
end

utils.funcs.getNearestVehicle = function()
    local nearest, nearestDistance = nil, math.huge
    for _, v in workspace.SpawnedCars:GetChildren() do
        local distance = (lplr.Character.PrimaryPart.Position - v.PrimaryPart.Position).Magnitude
        if distance < nearestDistance then
            nearest = v
            nearestDistance = distance
        end
    end

    return nearest
end

utils.funcs.randomString = function(length)
    local result = ''
    for i = 1, length do
        result = result..string.char(math.random(97, 122))
    end
    return result
end

return utils