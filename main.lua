-- games loader yada-yada!!

local games = {
    [6764533218] = 'troll.rip/games/washiez.lua'
}

local isfile = isfile or function(file)
    local suc, res = pcall(readfile, file)
    return suc and res ~= nil and res ~= ''
end

for i,v in games do
    if i == game.PlaceId then
        return isfile(v) == true and loadfile(v)() or isfile(v) == false and warn('No file found --> contact @._stav for help!')
    end
end

return isfile('troll.rip/games/universal.lua') == true and loadfile('troll.rip/games/universal.lua')() or isfile('troll.rip/games/universal.lua') == false and warn('No file found --> contact @._stav for help!')