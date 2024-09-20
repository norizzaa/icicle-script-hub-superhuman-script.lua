-- Infinite Jump Script
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid") or nil

-- Function to allow infinite jump
local function onJumpRequest()
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

-- Listen for jump input
UserInputService.JumpRequest:Connect(onJumpRequest)

-- Listen for character respawn to ensure the humanoid reference is updated
player.CharacterAdded:Connect(function(character)
    humanoid = character:FindFirstChildOfClass("Humanoid")
end)
