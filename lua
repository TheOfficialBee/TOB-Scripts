--// TOB Scripts - Tech UI
--// Premium Styled Roblox UI

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Remove old UI
if PlayerGui:FindFirstChild("TOB_TECH_UI") then
	PlayerGui.TOB_TECH_UI:Destroy()
end

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TOB_TECH_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- MAIN FRAME
local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Name = "Main"
Main.Size = UDim2.new(0, 470, 0, 320)
Main.Position = UDim2.new(0.34, 0, 0.22, 0)
Main.BackgroundColor3 = Color3.fromRGB(12,12,12)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0,18)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(0,255,170)
Stroke.Thickness = 1.8

local Glow = Instance.new("UIGradient", Stroke)
Glow.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0,255,170)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0,140,255))
}

-- TOP BAR
local Top = Instance.new("Frame")
Top.Parent = Main
Top.BackgroundColor3 = Color3.fromRGB(16,16,16)
Top.BorderSizePixel = 0
Top.Size = UDim2.new(1,0,0,52)

local TopCorner = Instance.new("UICorner", Top)
TopCorner.CornerRadius = UDim.new(0,18)

local Fix = Instance.new("Frame")
Fix.Parent = Top
Fix.BackgroundColor3 = Color3.fromRGB(16,16,16)
Fix.BorderSizePixel = 0
Fix.Position = UDim2.new(0,0,0.5,0)
Fix.Size = UDim2.new(1,0,0.5,0)

-- TITLE
local Title = Instance.new("TextLabel")
Title.Parent = Top
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1,0,1,0)
Title.Font = Enum.Font.GothamBlack
Title.Text = "TOB Scripts"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextSize = 27

-- SUBTITLE
local Sub = Instance.new("TextLabel")
Sub.Parent = Main
Sub.BackgroundTransparency = 1
Sub.Position = UDim2.new(0.05,0,0.20,0)
Sub.Size = UDim2.new(0.9,0,0,30)
Sub.Font = Enum.Font.GothamBold
Sub.Text = "Join our group to unlock access."
Sub.TextColor3 = Color3.fromRGB(0,255,170)
Sub.TextSize = 17
Sub.TextXAlignment = Enum.TextXAlignment.Left

-- INSTRUCTION FRAME
local InstructionsFrame = Instance.new("Frame")
InstructionsFrame.Parent = Main
InstructionsFrame.BackgroundTransparency = 1
InstructionsFrame.Position = UDim2.new(0.06,0,0.30,0)
InstructionsFrame.Size = UDim2.new(0.88,0,0.35,0)

-- ALL 4 POINTS
local Instructions = {
	"• Copy the link by pressing the COPY LINK button",
	"• Paste the link that you copied into your web browser",
	"• Join our group",
	"• Execute the script again to unlock it"
}

for i,v in ipairs(Instructions) do
	local Text = Instance.new("TextLabel")
	Text.Parent = InstructionsFrame
	Text.BackgroundTransparency = 1
	Text.Position = UDim2.new(0,0,0,(i-1)*38)
	Text.Size = UDim2.new(1,0,0,32)
	Text.Font = Enum.Font.Gotham
	Text.Text = v
	Text.TextColor3 = Color3.fromRGB(220,220,220)
	Text.TextSize = 18
	Text.TextXAlignment = Enum.TextXAlignment.Left
end

-- COPY BUTTON
local CopyButton = Instance.new("TextButton")
CopyButton.Parent = Main
CopyButton.Size = UDim2.new(0.78,0,0,58)
CopyButton.Position = UDim2.new(0.11,0,0.76,0)
CopyButton.BackgroundColor3 = Color3.fromRGB(0,200,120)
CopyButton.BorderSizePixel = 0
CopyButton.Font = Enum.Font.GothamBlack
CopyButton.Text = "COPY LINK"
CopyButton.TextColor3 = Color3.fromRGB(255,255,255)
CopyButton.TextSize = 24
CopyButton.AutoButtonColor = false

local CopyCorner = Instance.new("UICorner", CopyButton)
CopyCorner.CornerRadius = UDim.new(0,14)

local CopyStroke = Instance.new("UIStroke", CopyButton)
CopyStroke.Color = Color3.fromRGB(120,120,120)
CopyStroke.Thickness = 1.5

-- BUTTON HOVER EFFECT
CopyButton.MouseEnter:Connect(function()
	TweenService:Create(
		CopyButton,
		TweenInfo.new(0.15),
		{BackgroundColor3 = Color3.fromRGB(0,255,150)}
	):Play()
end)

CopyButton.MouseLeave:Connect(function()
	TweenService:Create(
		CopyButton,
		TweenInfo.new(0.15),
		{BackgroundColor3 = Color3.fromRGB(0,200,120)}
	):Play()
end)

-- TOGGLE BUTTON
local Toggle = Instance.new("TextButton")
Toggle.Parent = ScreenGui
Toggle.Size = UDim2.new(0,95,0,42)
Toggle.Position = UDim2.new(0.02,0,0.36,0)
Toggle.BackgroundColor3 = Color3.fromRGB(15,15,15)
Toggle.BorderSizePixel = 0
Toggle.Text = "TOB"
Toggle.Font = Enum.Font.GothamBlack
Toggle.TextColor3 = Color3.fromRGB(255,255,255)
Toggle.TextSize = 24
Toggle.Active = true
Toggle.Draggable = true

local ToggleCorner = Instance.new("UICorner", Toggle)
ToggleCorner.CornerRadius = UDim.new(0,12)

local ToggleStroke = Instance.new("UIStroke", Toggle)
ToggleStroke.Color = Color3.fromRGB(120,120,120)
ToggleStroke.Thickness = 1.6

-- TOGGLE FUNCTION
local Opened = true

Toggle.MouseButton1Click:Connect(function()
	Opened = not Opened
	Main.Visible = Opened
end)

-- COPY FUNCTION
CopyButton.MouseButton1Click:Connect(function()

	if setclipboard then
		setclipboard("https://roblox.com.ge/communities/3444899467/")
	end

	StarterGui:SetCore("SendNotification", {
		Title = "TOB Scripts",
		Text = "Link Copied!",
		Duration = 3
	})

	-- CLICK EFFECT
	local Tween = TweenService:Create(
		CopyButton,
		TweenInfo.new(0.1),
		{Size = UDim2.new(0.74,0,0,54)}
	)

	local Tween2 = TweenService:Create(
		CopyButton,
		TweenInfo.new(0.1),
		{Size = UDim2.new(0.78,0,0,58)}
	)

	Tween:Play()
	Tween.Completed:Wait()
	Tween2:Play()

end)
