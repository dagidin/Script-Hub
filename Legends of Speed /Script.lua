repeat task.wait() until game:IsLoaded()

-- if you're snooping around my code, feel free to change up the settings! :^)
getgenv().CollectOrbs = true
getgenv().CollectHoops = true
getgenv().AutoRebirth = true

local Player = game:GetService("Players").LocalPlayer

spawn(function()
    local PlayerHead = Player.Character:FindFirstChild("Head")
    while task.wait() do
        if not getgenv().CollectOrbs then break end
        for i, OrbTouch in pairs(game:GetService("Workspace").orbFolder:GetDescendants()) do
            if OrbTouch.Name == "TouchInterest" and OrbTouch.Parent then
                firetouchinterest(PlayerHead, OrbTouch.Parent, 1)
                task.wait(0.1)
                firetouchinterest(PlayerHead, OrbTouch.Parent, 0)
            end
        end
    end
end)

spawn(function()
    local PlayerHead = Player.Character:FindFirstChild("Head")
    while task.wait() do
        if not getgenv().CollectHoops then break end
        for i, HoopTouch in pairs(game:GetService("Workspace").Hoops:GetDescendants()) do
            if HoopTouch.Name == "TouchInterest" and HoopTouch.Parent then
                firetouchinterest(PlayerHead, HoopTouch.Parent, 0)
                task.wait(0.1)
                firetouchinterest(PlayerHead, HoopTouch.Parent, 1)
            end
        end
    end
end)

local function AutoRebirth()
    if not getgenv().AutoRebirth then return end
    local Remote = game:GetService("ReplicatedStorage").rEvents.rebirthEvent

    local CurrentLevel = string.split(Player.PlayerGui.gameGui.statsFrame.levelLabel.Text, " ")
    local RebirthLevel = string.split(Player.PlayerGui.gameGui.rebirthMenu.neededLabel.amountLabel.Text, " ")
    if tonumber(CurrentLevel[2]) >= tonumber(RebirthLevel[1]) then
        Remote:FireServer("rebirthRequest")
    end
end

local CurrentLevel = Player.PlayerGui.gameGui.statsFrame.levelLabel
CurrentLevel.Changed:Connect(AutoRebirth)
