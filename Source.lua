--if you skid this ur a bum


local UI = {}

-- // StarterGui.ScreenGui \\ --
UI["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
UI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

-- // StarterGui.ScreenGui.Frame \\ --
UI["2"] = Instance.new("Frame", UI["1"])
UI["2"]["BorderSizePixel"] = 3
UI["2"]["BackgroundColor3"] = Color3.fromRGB(103, 103, 103)
UI["2"]["Size"] = UDim2.new(0, 324, 0, 200)
UI["2"]["Position"] = UDim2.new(0.33727, 0, 0.32832, 0)
UI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)

-- // StarterGui.ScreenGui.Frame.UIAspectRatioConstraint \\ --
UI["3"] = Instance.new("UIAspectRatioConstraint", UI["2"])
UI["3"]["AspectRatio"] = 2.73

-- // StarterGui.ScreenGui.Frame.TextLabel \\ --
UI["4"] = Instance.new("TextLabel", UI["2"])
UI["4"]["TextWrapped"] = true
UI["4"]["BorderSizePixel"] = 0
UI["4"]["TextScaled"] = true
UI["4"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50)
UI["4"]["TextSize"] = 14
UI["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/Jura.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["4"]["Size"] = UDim2.new(0, 324, 0, 26)
UI["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["4"]["Text"] = [[The Kickinator]]

-- // StarterGui.ScreenGui.Frame.TextButton \\ --
UI["5"] = Instance.new("TextButton", UI["2"])
UI["5"]["TextWrapped"] = true
UI["5"]["BorderSizePixel"] = 3
UI["5"]["TextSize"] = 45
UI["5"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["5"]["BackgroundColor3"] = Color3.fromRGB(168, 168, 168)
UI["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/Jura.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["5"]["Size"] = UDim2.new(0, 200, 0, 50)
UI["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["5"]["Text"] = [[Kick!]]
UI["5"]["Position"] = UDim2.new(0.18553, 0, 0.375, 0)

-- // StarterGui.ScreenGui.Frame.TextButton.KickPlayerOnClick \\ --
UI["6"] = Instance.new("LocalScript", UI["5"])
UI["6"]["Name"] = [[KickPlayerOnClick]]

-- // StarterGui.ScreenGui.Frame.Drag \\ --
UI["7"] = Instance.new("LocalScript", UI["2"])
UI["7"]["Name"] = [[Drag]]

-- // StarterGui.ScreenGui.Frame.TextButton.KickPlayerOnClick \\ --
local function SCRIPT_6()
local script = UI["6"]
	local Players = game:GetService("Players")
	local textButton = script.Parent
	
	local kickPhrases = {
		"KICKINATOR - You've been kicked!",
		"KICKINATOR - get ur account beamed pooron",
		"KICKINATOR - PERMA BAN",
		"KICKINATOR - Exploits detected! Terminating ROBLOX account!",
		"KICKINATOR - fuck"
	}
	
	local function onButtonClicked()
		local player = Players.LocalPlayer
		if player then
			local randomIndex = math.random(1, #kickPhrases)
			local kickReason = kickPhrases[randomIndex]
			player:Kick(kickReason)
		end
	end
	
	textButton.MouseButton1Click:Connect(onButtonClicked)
	
end
task.spawn(SCRIPT_6)
-- // StarterGui.ScreenGui.Frame.Drag \\ --
local function SCRIPT_7()
local script = UI["7"]
	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
task.spawn(SCRIPT_7)

return UI["1"], require;
