local Games = {
    {"Legends of Speed", 3101667897, "https://raw.githubusercontent.com/dagidin/Script-Hub/main/Legends%20of%20Speed%20/Script.lua"}
}

for i, Game in ipairs(Games) do
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
    elseif i == #Games then
        warn("Couldn't find specified game in the script-hub, if you wish to add a suggestion join our Discord server!")
    end
end
