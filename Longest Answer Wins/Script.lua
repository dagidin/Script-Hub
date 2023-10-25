repeat task.wait() until game:IsLoaded()

-- if you're snooping around my code, feel free to change stuff up! :^)
getgenv().AutoAnswer = true

local RepStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

local Hint = RepStorage:FindFirstChild("HintAnswer")
local Submit = RepStorage:FindFirstChild("SubmittedAnswer")

local function Notify(Txt)
    StarterGui:SetCore("SendNotification", {
        Title = "Answer",
        Text = Txt
    })
end

local function AnswerQuestion()
    if not getgenv().AutoAnswer then return end
    local Correct = Hint.Value
    local Length = #Correct
    
    task.wait()
    if Correct ~= "" then Notify(Correct) end

    task.wait(math.random(20, 30) / 10 + Length / 5)
    Submit:FireServer(Correct, Length)
end

Hint:GetPropertyChangedSignal("Value"):Connect(AnswerQuestion)
