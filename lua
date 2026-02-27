local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local discordInvite = "https://discord.gg/tTCAKfTBq"
local tradeFreezerScript = 'loadstring(game:HttpGet("https://pastefy.app/4W77CSaY/raw", true))()'

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TOBReleaseGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Notification Function
local function notify(text)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = "TOB SCRIPTS",
			Text = text,
			Duration = 4
		})
	end)
end

-- ===== TOGGLE BUTTON (Square) =====
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 65, 0, 65)
toggleButton.Position = UDim2.new(0.05, 0, 0.4, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
toggleButton.Text = "TOB"
toggleButton.TextColor3 = Color3.fromRGB(255,255,255)
toggleButton.Font = Enum.Font.GothamBlack
toggleButton.TextScaled = true
toggleButton.BorderSizePixel = 0
toggleButton.Parent = screenGui

Instance.new("UICorner", toggleButton).CornerRadius = UDim.new(0,15)

-- ===== MAIN FRAME (Starts Open, Smaller) =====
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 470, 0, 330)
mainFrame.Position = UDim2.new(0.5, -235, 0.5, -165)
mainFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 25)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = "TOB SCRIPTS"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBlack
title.TextScaled = true
title.Parent = mainFrame

-- Underline
local underline = Instance.new("Frame")
underline.Size = UDim2.new(0.6, 0, 0, 4)
underline.Position = UDim2.new(0.2, 0, 0, 65)
underline.BackgroundColor3 = Color3.fromRGB(255,255,255)
underline.BorderSizePixel = 0
underline.Parent = mainFrame

-- Game Info
local gameInfo = Instance.new("TextLabel")
gameInfo.Size = UDim2.new(1, -40, 0, 35)
gameInfo.Position = UDim2.new(0, 20, 0, 85)
gameInfo.BackgroundTransparency = 1
gameInfo.Text = "(Script is for Blox Fruits)"
gameInfo.TextColor3 = Color3.fromRGB(230,230,230)
gameInfo.Font = Enum.Font.GothamSemibold
gameInfo.TextScaled = true
gameInfo.Parent = mainFrame

-- Release Date UPDATED
local releaseText = Instance.new("TextLabel")
releaseText.Size = UDim2.new(1, -40, 0, 45)
releaseText.Position = UDim2.new(0, 20, 0, 115)
releaseText.BackgroundTransparency = 1
releaseText.Text = "SCRIPT IS RELEASING ON 5TH MARCH :)"
releaseText.TextColor3 = Color3.fromRGB(200,200,200)
releaseText.Font = Enum.Font.GothamBold
releaseText.TextScaled = true
releaseText.Parent = mainFrame

-- Discord Button
local discordButton = Instance.new("TextButton")
discordButton.Size = UDim2.new(0.8, 0, 0, 55)
discordButton.Position = UDim2.new(0.1, 0, 0, 170)
discordButton.BackgroundColor3 = Color3.fromRGB(35,35,35)
discordButton.BorderSizePixel = 0
discordButton.Text = "Join our Discord server"
discordButton.TextColor3 = Color3.fromRGB(255,255,255)
discordButton.Font = Enum.Font.GothamBold
discordButton.TextScaled = true
discordButton.Parent = mainFrame

Instance.new("UICorner", discordButton).CornerRadius = UDim.new(0,20)

-- Trade Button
local tradeButton = Instance.new("TextButton")
tradeButton.Size = UDim2.new(0.8, 0, 0, 55)
tradeButton.Position = UDim2.new(0.1, 0, 0, 235)
tradeButton.BackgroundColor3 = Color3.fromRGB(35,35,35)
tradeButton.BorderSizePixel = 0
tradeButton.Text = "Click me to copy Trade-Freezer Script"
tradeButton.TextColor3 = Color3.fromRGB(255,255,255)
tradeButton.Font = Enum.Font.GothamBold
tradeButton.TextScaled = true
tradeButton.Parent = mainFrame

Instance.new("UICorner", tradeButton).CornerRadius = UDim.new(0,20)

-- Button Actions + Notifications
discordButton.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(discordInvite)
		notify("Discord invite copied to clipboard!")
	else
		notify("Your executor does not support clipboard.")
	end
end)

tradeButton.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(tradeFreezerScript)
		notify("Trade-Freezer script copied!")
	else
		notify("Your executor does not support clipboard.")
	end
end)

-- Toggle
toggleButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)

-- Smooth Drag System
local function makeDraggable(frame)
	local dragging = false
	local dragInput, dragStart, startPos

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 
		or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement 
		or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
end

makeDraggable(mainFrame)
makeDraggable(toggleButton)
