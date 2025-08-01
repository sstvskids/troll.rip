-- games loader yada-yada!!

local games = {
    [6764533218] = 'troll.rip/games/washiez.lua',
    [0] = 'troll.rip/games/universal.lua' -- no game with 0, so we good
}

print('troll.rip | main.lua')

for i,v in games do
    if i == game.PlaceId then
        return isfile(v) and loadfile(v)() or warn('No file found --> contact @._stav for help!')
    end
end

return isfile('troll.rip/games/universal.lua') and loadfile('troll.rip/games/universal.lua')() or warn('No file found --> contact @._stav for help!')