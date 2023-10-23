repeat task.wait() until game:IsLoaded()

-- if you're snooping around my code feel free to change some stuff up! :^)
getgenv().AutoVote = true
getgenv().Selection = "Kill"

local Player = game:GetService("Players").LocalPlayer
local Workspace = game:GetService("Workspace")

local Vote = game:GetService("ReplicatedStorage").Remotes:FindFirstChild("V")
pcall(function()
    local function UpdateTimer()
        local Timer = Player.PlayerGui.MainUi.Timer
        if getgenv().AutoVote then
            local Text = Workspace.Board.SurfaceGui.Frame.TextLabel.Text
            if Text == "5" then
                Timer.Visible = true
            end
            Timer.TextLabel.Text = Text
            if Text == "0" then
                task.wait(1)
                Timer.TextLabel.Text = ""
            end
        else 
            Timer.TextLabel.Text = ""
        end
    end
    Workspace.Board.SurfaceGui.Frame.TextLabel:GetPropertyChangedSignal("Text"):Connect(UpdateTimer)
end)

Vote.OnClientEvent:Connect(function()
	if getgenv().AutoVote then
		pcall(function()
			task.wait(1)
			Vote:FireServer(getgenv().Selection, 1)
		end)
	end
end)
