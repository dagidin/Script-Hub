local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/dagidin/Script-Hub/main/Games.lua"))()

for i, Game in ipairs(getgenv().Games) do
    if game.PlaceId == Game[2] then
        local Script = Game[3]
        local Success, ErrMsg = 
            pcall(function()
                loadstring(game:HttpGet(Script))()
            end)
        if not Success then
            warn("Failed to Load Script for " .. Game[1] .. " : " .. ErrMsg)
        end
        break
    elseif i == #getgenv().Games then
        warn("Couldn't find specified game in the script-hub!")
    end
end
