repeat task.wait() until game:IsLoaded()

-- if you're snooping around my code you can change it up a bit! :^)
getgenv().AutoFarmEnabled = true

local Player = game:GetService("Players").LocalPlayer

local AutoFarm = function(CurrentRun)
    local Character = Player.Character
    local NormalStages = game:GetService("Workspace").BoatStages.NormalStages

    for i = 1, 10 do
        local Stage = NormalStages["CaveStage" .. i]
        local EndPart = Stage:FindFirstChild("DarknessPart")
        local RootPart = Character:FindFirstChild("HumanoidRootPart")

        if EndPart then
            print("Teleporting to Stage " .. i .. "...")
            RootPart.CFrame = EndPart.CFrame

            local Part = Instance.new("Part", Character)
            Part.Anchored = true
            Part.Position = RootPart.Position - Vector3.new(0, 5, 0)
            Part.Transparency = 1

            task.wait(2)
            Part:Destroy()
        end
    end

    print("Teleporting to the End...")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Lighting = game:GetService("Lighting")

    repeat task.wait()
        RootPart.CFrame = NormalStages.TheEnd.GoldenChest.Trigger.CFrame
    until Lighting.ClockTime ~= 14

    local Respawned = false
    local Connection

    Connection = Player.CharacterAdded:Connect(function()
        Respawned = true
        Connection:Disconnect()
    end)

    repeat task.wait() until Respawned
    task.wait(5)
    print("Auto Farm " .. CurrentRun .. " Finished")
end

local AutoFarmRun = 1
while task.wait() do
    if getgenv().AutoFarmEnabled then
        print("Initializing Auto Farm " .. AutoFarmRun)
        AutoFarm(AutoFarmRun)
        AutoFarmRun = AutoFarmRun + 1
    end
end
