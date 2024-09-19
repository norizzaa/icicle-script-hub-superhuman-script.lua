local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Wait for the Humanoid to load
local humanoid = character:WaitForChild("Humanoid")

-- Change WalkSpeed and JumpPower
humanoid.WalkSpeed = 100
humanoid.JumpPower = 200
