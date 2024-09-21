-- Local Script for Player GUI

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ControlGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create the Frame (Draggable GUI)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 240)
frame.Position = UDim2.new(0.5, -150, 0.5, -120)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Draggable = true
frame.Active = true
frame.Parent = screenGui

-- Create Header Label
local headerLabel = Instance.new("TextLabel")
headerLabel.Size = UDim2.new(0, 280, 0, 30)
headerLabel.Position = UDim2.new(0, 10, 0, 10)
headerLabel.Text = "FE Script made by ChatGPT"
headerLabel.BackgroundTransparency = 1
headerLabel.TextColor3 = Color3.new(1, 1, 1)
headerLabel.TextScaled = true
headerLabel.Parent = frame

-- Create Speed Label
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 280, 0, 30)
speedLabel.Position = UDim2.new(0, 10, 0, 50)
speedLabel.Text = "Speed: 16" -- Default humanoid walk speed is 16
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.new(1, 1, 1)
speedLabel.Parent = frame

-- Create Speed Slider Frame
local speedSliderFrame = Instance.new("Frame")
speedSliderFrame.Size = UDim2.new(0, 280, 0, 20)
speedSliderFrame.Position = UDim2.new(0, 10, 0, 82) -- 2-pixel space between label and slider
speedSliderFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
speedSliderFrame.Parent = frame

-- Create Speed Slider Button (draggable handle)
local speedSliderButton = Instance.new("ImageButton")
speedSliderButton.Size = UDim2.new(0, 20, 0, 20)
speedSliderButton.Position = UDim2.new(0, 0, 0, 0)
speedSliderButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
speedSliderButton.Parent = speedSliderFrame

-- Create Speed TextBox
local speedTextBox = Instance.new("TextBox")
speedTextBox.Size = UDim2.new(0, 280, 0, 30)
speedTextBox.Position = UDim2.new(0, 10, 0, 110)
speedTextBox.PlaceholderText = "Enter Speed (30-500)"
speedTextBox.TextColor3 = Color3.new(1, 1, 1)
speedTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
speedTextBox.Parent = frame

-- Create JumpPower Label
local jumpPowerLabel = Instance.new("TextLabel")
jumpPowerLabel.Size = UDim2.new(0, 280, 0, 30)
jumpPowerLabel.Position = UDim2.new(0, 10, 0, 150)
jumpPowerLabel.Text = "JumpPower: 50" -- Default humanoid jump power is 50
jumpPowerLabel.BackgroundTransparency = 1
jumpPowerLabel.TextColor3 = Color3.new(1, 1, 1)
jumpPowerLabel.Parent = frame

-- Create JumpPower Slider Frame
local jumpPowerSliderFrame = Instance.new("Frame")
jumpPowerSliderFrame.Size = UDim2.new(0, 280, 0, 20)
jumpPowerSliderFrame.Position = UDim2.new(0, 10, 0, 182) -- 2-pixel space between label and slider
jumpPowerSliderFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
jumpPowerSliderFrame.Parent = frame

-- Create JumpPower Slider Button (draggable handle)
local jumpPowerSliderButton = Instance.new("ImageButton")
jumpPowerSliderButton.Size = UDim2.new(0, 20, 0, 20)
jumpPowerSliderButton.Position = UDim2.new(0, 0, 0, 0)
jumpPowerSliderButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
jumpPowerSliderButton.Parent = jumpPowerSliderFrame

-- Create JumpPower TextBox
local jumpPowerTextBox = Instance.new("TextBox")
jumpPowerTextBox.Size = UDim2.new(0, 280, 0, 30)
jumpPowerTextBox.Position = UDim2.new(0, 10, 0, 210)
jumpPowerTextBox.PlaceholderText = "Enter JumpPower (30-500)"
jumpPowerTextBox.TextColor3 = Color3.new(1, 1, 1)
jumpPowerTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
jumpPowerTextBox.Parent = frame

-- Define min and max values for both sliders
local minSpeed = 30
local maxSpeed = 500
local minJumpPower = 30
local maxJumpPower = 500

-- Function to move the speed slider button based on user input
local function updateSpeedSlider(input)
    local sliderPos = (input.Position.X - speedSliderFrame.AbsolutePosition.X) / speedSliderFrame.AbsoluteSize.X
    sliderPos = math.clamp(sliderPos, 0, 1) -- Clamp between 0 and 1
    speedSliderButton.Position = UDim2.new(sliderPos, 0, 0, 0)
    local newSpeed = minSpeed + (maxSpeed - minSpeed) * sliderPos
    humanoid.WalkSpeed = newSpeed
    speedLabel.Text = "Speed: " .. math.floor(newSpeed)
    speedTextBox.Text = tostring(math.floor(newSpeed)) -- Update textbox
end

-- Function to move the jump power slider button based on user input
local function updateJumpPowerSlider(input)
    local sliderPos = (input.Position.X - jumpPowerSliderFrame.AbsolutePosition.X) / jumpPowerSliderFrame.AbsoluteSize.X
    sliderPos = math.clamp(sliderPos, 0, 1) -- Clamp between 0 and 1
    jumpPowerSliderButton.Position = UDim2.new(sliderPos, 0, 0, 0)
    local newJumpPower = minJumpPower + (maxJumpPower - minJumpPower) * sliderPos
    humanoid.JumpPower = newJumpPower
    jumpPowerLabel.Text = "JumpPower: " .. math.floor(newJumpPower)
    jumpPowerTextBox.Text = tostring(math.floor(newJumpPower)) -- Update textbox
end

-- Function to update speed from textbox input
local function setSpeedFromTextBox()
    local speedValue = tonumber(speedTextBox.Text)
    if speedValue and speedValue >= minSpeed and speedValue <= maxSpeed then
        humanoid.WalkSpeed = speedValue
        speedLabel.Text = "Speed: " .. speedValue
        -- Update slider position
        local sliderPos = (speedValue - minSpeed) / (maxSpeed - minSpeed)
        speedSliderButton.Position = UDim2.new(sliderPos, 0, 0, 0)
    else
        speedTextBox.Text = "Invalid Input"
    end
end

-- Function to update jump power from textbox input
local function setJumpPowerFromTextBox()
    local jumpPowerValue = tonumber(jumpPowerTextBox.Text)
    if jumpPowerValue and jumpPowerValue >= minJumpPower and jumpPowerValue <= maxJumpPower then
        humanoid.JumpPower = jumpPowerValue
        jumpPowerLabel.Text = "JumpPower: " .. jumpPowerValue
        -- Update slider position
        local sliderPos = (jumpPowerValue - minJumpPower) / (maxJumpPower - minJumpPower)
        jumpPowerSliderButton.Position = UDim2.new(sliderPos, 0, 0, 0)
    else
        jumpPowerTextBox.Text = "Invalid Input"
    end
end

-- Make the speed slider button draggable
speedSliderButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local moveConnection, releaseConnection
        moveConnection = game:GetService("UserInputService").InputChanged:Connect(function(moveInput)
            if moveInput.UserInputType == Enum.UserInputType.MouseMovement or moveInput.UserInputType == Enum.UserInputType.Touch then
                updateSpeedSlider(moveInput)
            end
        end)
        releaseConnection = game:GetService("UserInputService").InputEnded:Connect(function(endInput)
            if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
                moveConnection:Disconnect()
                releaseConnection:Disconnect()
            end
        end)
    end
end)

-- Make the jump power slider button draggable
jumpPowerSliderButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local moveConnection, releaseConnection
        moveConnection = game:GetService("UserInputService").InputChanged:Connect(function(moveInput)
            if moveInput.UserInputType == Enum.UserInputType.MouseMovement or moveInput.UserInputType == Enum.UserInputType.Touch then
                updateJumpPowerSlider(moveInput)
            end
        end)
        releaseConnection = game:GetService("UserInputService").InputEnded:Connect(function(endInput)
            if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
                moveConnection:Disconnect()
                releaseConnection:Disconnect()
            end
        end)
    end
end)

-- Connect TextBox events
speedTextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        setSpeedFromTextBox()
    end
end)

jumpPowerTextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        setJumpPowerFromTextBox()
    end
end)
