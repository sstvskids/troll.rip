-- games loader yada-yada!!

local games = {
    [6764533218] = 'troll.rip/games/washiez.lua'
}

for i,v in games do
    if i == game.PlaceId then
        if isfile(v) then
            return loadfile(v)()
        else
            warn('what the dawg doing?')
            return
        end
        break
    end
    
    return
end