--[[
    gitLuaU

    A easier way to use github api links
    by: @stav

    Works like a charm, and is un-detected also ;)
]]

--[[
    Usage example (troll.rip)

    local gitAPI = loadstring(game:HttpGet('url-here'))()
    local url = gitAPI.getURL('sstvskids', 'troll.rip')

    for _,v in {'troll.rip', 'troll.rip/libraries', 'troll.rip/games', 'troll.rip/configs'} do
        if not isfolder(v) then
            task.spawn(makefolder, v)
        end
    end

    local folders = {}
    gitAPI.getFolders(url, folders)

    gitAPI.downloadURLs(url, 'troll.rip')

    for i,v in folders do
        gitAPI.downloadURLs(url, 'troll.rip', v)
    end
]]

local api = {}

local cloneref = cloneref or function(obj)
    return obj
end
local httpService = cloneref(game:GetService('HttpService'))

api.getURL = function(user, repo)
    if not user or not repo then
        warn('No user or repo')
        return
    end

    return 'https://api.github.com/repos/'..user..'/'..repo..'/contents/'
end

api.getFolders = function(url, folder)
    if type(folder) ~= 'table' then
        return error('Folder is not a table', 2)
    end
    if not url then 
        return error('No URL found: Error 404 (or folder)', 2)
    end

    local function scan(path) -- idc just make sure it gets all the directories
        local scanurl = url..path
        for _, v in httpService:JSONDecode(game:HttpGet(scanurl)) do
            if v.type == 'dir' then
                table.insert(folder, v.path)
                scan(v.path)
            end
        end
    end

    scan('')
end

api.downloadURLs = function(url, reponame, folders)
    if not url then 
        return error('No URL found: Error 404', 2)
    end

    folders = folders or ''
    for _, v in httpService:JSONDecode(game:HttpGet(url..folders)) do
        if v.type == 'file' then
            if isfile(reponame..'/'..v.path) then task.spawn(delfile, reponame..'/'..v.path) end
            task.spawn(writefile, reponame..'/'..v.path, game:HttpGet(v.download_url))
        end
    end
end

return api