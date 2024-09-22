-- Local Script for Player GUI

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ControlGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create the Frame (Draggable GUI)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 340)  -- Make GUI bigger
frame.Position = UDim2.new(0.5, -200, 0.5, -170)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Draggable = true
frame.Active = true
frame.Parent = screenGui

-- Create Header Label
local headerLabel = Instance.new("TextLabel")
headerLabel.Size = UDim2.new(0, 300, 0, 24)
headerLabel.Position = UDim2.new(0, 10, 0, 10)
headerLabel.Text = "Chatgpt fe hub"
headerLabel.BackgroundTransparency = 1
headerLabel.TextColor3 = Color3.new(1, 1, 1)
headerLabel.TextScaled = true
headerLabel.Parent = frame

-- Rainbow Animation for Header
coroutine.wrap(function()
    local hue = 0
    while true do
        hue = hue + 0.01
        headerLabel.TextColor3 = Color3.fromHSV(hue % 1, 1, 1)
        wait(0.1) -- Adjust the speed of color change here if needed
    end
end)()

-- Create Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Parent = frame

-- Create Minimize Button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 25, 0, 25)
minimizeButton.Position = UDim2.new(1, -70, 0, 10)
minimizeButton.Text = "-"
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
minimizeButton.TextColor3 = Color3.new(0, 0, 0)
minimizeButton.Parent = frame

-- Create Notification Label
local notificationLabel = Instance.new("TextLabel")
notificationLabel.Size = UDim2.new(0, 400, 0, 50)
notificationLabel.Position = UDim2.new(1, -410, 1, -60) -- Bottom right position
notificationLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
notificationLabel.TextColor3 = Color3.new(1, 1, 1)
notificationLabel.TextScaled = true
notificationLabel.BackgroundTransparency = 0.5
notificationLabel.Visible = false
notificationLabel.Parent = screenGui

-- Function to show notification
local function showNotification(message)
    notificationLabel.Text = message
    notificationLabel.Visible = true
    local hue = 0
    while notificationLabel.Visible do
        hue = hue + 0.01
        notificationLabel.TextColor3 = Color3.fromHSV(hue % 1, 1, 1)
        wait(0.1) -- Adjust the speed of color change here if needed
    end
    wait(3) -- Show for 3 seconds
    notificationLabel.Visible = false
end

-- Create Speed Label
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 380, 0, 30)
speedLabel.Position = UDim2.new(0, 10, 0, 50)
speedLabel.Text = "Speed: 16" -- Default humanoid walk speed is 16
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.new(1, 1, 1)
speedLabel.Parent = frame

-- Create Speed Slider Frame
local speedSliderFrame = Instance.new("Frame")
speedSliderFrame.Size = UDim2.new(0, 380, 0, 20)
speedSliderFrame.Position = UDim2.new(0, 10, 0, 82)
speedSliderFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
speedSliderFrame.Parent = frame

-- Create Speed Slider Button (draggable handle)
local speedSliderButton = Instance.new("ImageButton")
speedSliderButton.Size = UDim2.new(0, 20, 0, 20)
speedSliderButton.Position = UDim2.new(0, 0, 0, 0)
speedSliderButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
speedSliderButton.Parent = speedSliderFrame

-- Create JumpPower Label
local jumpPowerLabel = Instance.new("TextLabel")
jumpPowerLabel.Size = UDim2.new(0, 380, 0, 30)
jumpPowerLabel.Position = UDim2.new(0, 10, 0, 150)
jumpPowerLabel.Text = "JumpPower: 50"
jumpPowerLabel.BackgroundTransparency = 1
jumpPowerLabel.TextColor3 = Color3.new(1, 1, 1)
jumpPowerLabel.Parent = frame

-- Create JumpPower Slider Frame
local jumpPowerSliderFrame = Instance.new("Frame")
jumpPowerSliderFrame.Size = UDim2.new(0, 380, 0, 20)
jumpPowerSliderFrame.Position = UDim2.new(0, 10, 0, 182)
jumpPowerSliderFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
jumpPowerSliderFrame.Parent = frame

-- Create JumpPower Slider Button (draggable handle)
local jumpPowerSliderButton = Instance.new("ImageButton")
jumpPowerSliderButton.Size = UDim2.new(0, 20, 0, 20)
jumpPowerSliderButton.Position = UDim2.new(0, 0, 0, 0)
jumpPowerSliderButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
jumpPowerSliderButton.Parent = jumpPowerSliderFrame

-- Create Light/Dark Theme Toggle
local themeToggleLabel = Instance.new("TextLabel")
themeToggleLabel.Size = UDim2.new(0, 380, 0, 30)
themeToggleLabel.Position = UDim2.new(0, 10, 0, 250)
themeToggleLabel.Text = "Light Theme"
themeToggleLabel.BackgroundTransparency = 1
themeToggleLabel.TextColor3 = Color3.new(1, 1, 1)
themeToggleLabel.Parent = frame

local themeToggleButton = Instance.new("TextButton")
themeToggleButton.Size = UDim2.new(0, 100, 0, 30)
themeToggleButton.Position = UDim2.new(0, 290, 0, 250)
themeToggleButton.Text = "Toggle"
themeToggleButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
themeToggleButton.TextColor3 = Color3.new(1, 1, 1)
themeToggleButton.Parent = frame

local isLightTheme = true

-- Toggle between light and dark theme
themeToggleButton.MouseButton1Click:Connect(function()
    isLightTheme = not isLightTheme
    if isLightTheme then
        frame.BackgroundColor3 = Color3.new(1, 1, 1)
        speedLabel.TextColor3 = Color3.new(0, 0, 0)
        jumpPowerLabel.TextColor3 = Color3.new(0, 0, 0)
        themeToggleLabel.Text = "Light Theme"
        themeToggleButton.TextColor3 = Color3.new(0, 0, 0)
    else
        frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
        speedLabel.TextColor3 = Color3.new(1, 1, 1)
        jumpPowerLabel.TextColor3 = Color3.new(1, 1, 1)
        themeToggleLabel.Text = "Dark Theme"
        themeToggleButton.TextColor3 = Color3.new(1, 1, 1)
    end
end)

-- Smooth slider animations for speed and jump power
local function smoothSlider(button, position)
    local tween = tweenService:Create(button, TweenInfo.new(0.5), {Position = position})
    tween:Play()
end

-- Smooth Speed Slider
speedSliderButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local moveConnection, releaseConnection
        moveConnection = userInputService.InputChanged:Connect(function(moveInput)
            if moveInput.UserInputType == Enum.UserInputType.MouseMovement or moveInput.UserInputType == Enum.UserInputType.Touch then
                local sliderPos = (moveInput.Position.X - speedSliderFrame.AbsolutePosition.X) / speedSliderFrame.AbsoluteSize.X
                sliderPos = math.clamp(sliderPos, 0, 1)
                smoothSlider(speedSliderButton, UDim2.new(sliderPos, 0, 0, 0))
                local newSpeed = 30 + (500 - 30) * sliderPos
                humanoid.WalkSpeed = math.floor(newSpeed)
                speedLabel.Text = "Speed: " .. math.floor(newSpeed)
            end
        end)

        releaseConnection = userInputService.InputEnded:Connect(function(endInput)
            if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
                moveConnection:Disconnect()
                releaseConnection:Disconnect()
            end
        end)
    end
end)

-- Smooth JumpPower Slider
jumpPowerSliderButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local moveConnection, releaseConnection
        moveConnection = userInputService.InputChanged:Connect(function(moveInput)
            if moveInput.UserInputType == Enum.UserInputType.MouseMovement or moveInput.UserInputType == Enum.UserInputType.Touch then
                local sliderPos = (moveInput.Position.X - jumpPowerSliderFrame.AbsolutePosition.X) / jumpPowerSliderFrame.AbsoluteSize.X
                sliderPos = math.clamp(sliderPos, 0, 1)
                smoothSlider(jumpPowerSliderButton, UDim2.new(sliderPos, 0, 0, 0))
                local newJumpPower = 50 + (500 - 50) * sliderPos
                humanoid.JumpPower = math.floor(newJumpPower)
                jumpPowerLabel.Text = "JumpPower: " .. math.floor(newJumpPower)
            end
        end)

        releaseConnection = userInputService.InputEnded:Connect(function(endInput)
            if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
                moveConnection:Disconnect()
                releaseConnection:Disconnect()
            end
        end)
    end
end)

-- Close Button Functionality
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Minimize button functionality
minimizeButton.MouseButton1Click:Connect(function()
    frame.Visible = false
    showNotification("Click E to reopen the GUI. If you're on mobile, load up a keyboard script and hit E.")
end)

-- Reopen GUI with E
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.E then
        frame.Visible = true
        notificationLabel.Visible = false
    end
end)

-- Ensure the notification is cleared when the GUI is opened
frame:GetPropertyChangedSignal("Visible"):Connect(function()
    if frame.Visible then
        notificationLabel.Visible = false
    end
end)


-- added themes, smoother sliders and more!

print("Update 1: added themes, smoother sliders, and more!")
