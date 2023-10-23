repeat task.wait() until game:IsLoaded()

-- if you're snooping around my code, feel free to change up the settings! :^)
getgenv().CollectOrbs = true
getgenv().CollectHoops = true
getgenv().AutoRebirth = true

local Player = game:GetService("Players").LocalPlayer

local function CollectOrbsFunc()
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
end

local function CollectHoopsFunc()
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
end

local function AutoRebirthFunc()
    spawn(function()
        while task.wait(5) do
            if not getgenv().AutoRebirth then break end
            game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
        end
    end)
end

CollectOrbsFunc()
CollectHoopsFunc()
AutoRebirthFunc()
