-- games loader yada-yada!!

local games = {
    [6764533218] = 'troll.rip/games/washiez.lua'
    [0] = 'troll.rip/games/universal.lua' -- no game with 0, so we good
}

for i,v in games do
    if i == game.PlaceId then
        if isfile(v) then
            return loadfile(v)()
        else
            warn('No file found --> contact @._stav for help!')
            return
        end
    end

    if i ~= game.PlaceId and i == 0 then
        if isfile(v) then
            return loadfile(v)()
        else
            warn('No file found --> contact @._stav for help!')
            return
        end
    end
end