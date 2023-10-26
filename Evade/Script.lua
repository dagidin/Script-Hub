repeat task.wait() until game:IsLoaded()

-- if you're snooping around my code feel free to change stuff up! :^)
getgenv().InfiniteJump = true
getgenv().SuperMan = true
getgenv().GodMode = true

getgenv().WalkSpeed = 100
getgenv().JumpPower = 100

local Player = game:GetService("Players").LocalPlayer
local UserInput = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

RunService.Stepped:Connect(function()
    if not getgenv().SuperMan then return end
    pcall(function()
        local Humanoid = Player.Character:FindFirstChild("Humanoid")
        Humanoid:SetAttribute("RealSpeed", tonumber(getgenv().WalkSpeed) * 25)
        Humanoid:SetAttribute("RealJumpHeight", tonumber(Settings.JumpPower))
    end)
end)

UserInput.JumpRequest:Connect(function()
    if not getgenv().InfiniteJump then return end
    local Humanoid = Player.Character:FindFirstChild("Humanoid")
    if Humanoid then
        Humanoid:ChangeState("Jumping")
    end
end)

local function GodMode()
    local Humanoid = Player.Character:FindFirstChild("Humanoid")
    pcall(function()
        if not getgenv().GodMode then return end
        Humanoid.Parent = nil
        Humanoid.Parent  = Player.Character
    end)
end

Player.CharacterAdded:Connect(function()
    GodMode()
end)
