
--// Services
local UserInputService = game:GetService("UserInputService");

--// Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/lates-lib/main/Main.lua"))()
local Window = Library:CreateWindow({
	Title = "???",
	Theme = "Dark",
	
	Size = UDim2.fromOffset(487, 307),
	Transparency = 0.2,
	Blurring = true,
	MinimizeKeybind = Enum.KeyCode.LeftAlt,
})

local Themes = {
	Light = {
		--// Frames:
		Primary = Color3.fromRGB(232, 232, 232),
		Secondary = Color3.fromRGB(255, 255, 255),
		Component = Color3.fromRGB(245, 245, 245),
		Interactables = Color3.fromRGB(235, 235, 235),

		--// Text:
		Tab = Color3.fromRGB(50, 50, 50),
		Title = Color3.fromRGB(0, 0, 0),
		Description = Color3.fromRGB(100, 100, 100),

		--// Outlines:
		Shadow = Color3.fromRGB(255, 255, 255),
		Outline = Color3.fromRGB(210, 210, 210),

		--// Image:
		Icon = Color3.fromRGB(100, 100, 100),
	},
	
	Dark = {
		--// Frames:
		Primary = Color3.fromRGB(30, 30, 30),
		Secondary = Color3.fromRGB(35, 35, 35),
		Component = Color3.fromRGB(40, 40, 40),
		Interactables = Color3.fromRGB(45, 45, 45),

		--// Text:
		Tab = Color3.fromRGB(200, 200, 200),
		Title = Color3.fromRGB(240,240,240),
		Description = Color3.fromRGB(200,200,200),

		--// Outlines:
		Shadow = Color3.fromRGB(0, 0, 0),
		Outline = Color3.fromRGB(40, 40, 40),

		--// Image:
		Icon = Color3.fromRGB(220, 220, 220),
	},
	
	Void = {
		--// Frames:
		Primary = Color3.fromRGB(15, 15, 15),
		Secondary = Color3.fromRGB(20, 20, 20),
		Component = Color3.fromRGB(25, 25, 25),
		Interactables = Color3.fromRGB(30, 30, 30),

		--// Text:
		Tab = Color3.fromRGB(200, 200, 200),
		Title = Color3.fromRGB(240,240,240),
		Description = Color3.fromRGB(200,200,200),

		--// Outlines:
		Shadow = Color3.fromRGB(0, 0, 0),
		Outline = Color3.fromRGB(40, 40, 40),

		--// Image:
		Icon = Color3.fromRGB(220, 220, 220),
	},

}

--// Set the default theme
Window:SetTheme(Themes.Dark)

--// Sections
Window:AddTabSection({
	Name = "Main",
	Order = 1,
})

Window:AddTabSection({
	Name = "Settings",
	Order = 2,
})

--// Tab [MAIN]

local Main = Window:AddTab({
	Title = "Catching",
	Section = "Main",
	Icon = "rbxassetid://11963373994"
})

local Player = Window:AddTab({
	Title = "Player",
	Section = "Player",
	Icon = "rbxassetid://11963373994"
})

local Physics = Window:AddTab({
	Title = "Physics",
	Section = "Physics",
	Icon = "rbxassetid://11963373994"
})

local Visuals = Window:AddTab({
	Title = "Visuals",
	Section = "Visuals",
	Icon = "rbxassetid://11963373994"
})

Window:AddSection({ Name = "Echo.cc", Tab = Main }) 




Window:AddSection({ Name = "Interactable", Tab = Main }) 

Window:AddToggle({
	Title = "Magnets",
	Description = "Strong Magnets",
	Tab = Main,
	Callback = function(Boolean) 
		warn(Boolean);
	local workspaceService = game:GetService("Workspace")
local footballName = "Football"

local function onFootballAdded(newChild)
    if newChild:IsA("BasePart") and newChild.Name == footballName then
        newChild.Size = Vector3.new(25, 25, 25)
        newChild.CanCollide = false
        newChild.Massless = true
        print("Football properties modified.")
    end
end

workspaceService.ChildAdded:Connect(onFootballAdded)

for _, child in pairs(workspaceService:GetChildren()) do
    if child:IsA("BasePart") and child.Name == footballName then
        onFootballAdded(child)
    end
end
end,
}) 

Window:AddSlider({
	Title = "Catch Distance",
	Description = "Catch Distance",
	Tab = Main,
	MaxValue = 100,
	Callback = function(Amount) 
		warn(Amount);
	end,
})

Window:AddToggle({
	Title = "Pull Vector",
	Description = "Low Pull Vector",
	Tab = Main,
	Callback = function(Boolean) 
		warn(Boolean);
	end,
}) 

Window:AddSlider({
	Title = "Pull Vector Distance",
	Description = "Force",
	Tab = Main,
	MaxValue = 70,
	Callback = function(Amount) 
		warn(Amount);
	end,
})

Window:AddToggle({
	Title = "AntiJam",
	Description = "AntiJam",
	Tab = Player,
	Callback = function(Boolean) 
		warn(Boolean);
	local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local function NoCollision()
    for _, v in pairs(Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
end

NoCollision()

LocalPlayer.CharacterAdded:Connect(function(character)
    Character = character
    NoCollision()
end)

while true do
    NoCollision()
    task.wait(0.1)
end
end,
}) 

Window:AddToggle({
	Title = "LongArms",
	Description = "Makes Arms long",
	Tab = Player,
	Callback = function(Boolean) 
		warn(Boolean);
	local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function extendArms(character, scaleFactor)
    local leftArm = character:FindFirstChild("Left Arm")
    local rightArm = character:FindFirstChild("Right Arm")

    local leftLowerArm = character:FindFirstChild("LeftLowerArm")
    local rightLowerArm = character:FindFirstChild("RightLowerArm")
    local leftUpperArm = character:FindFirstChild("LeftUpperArm")
    local rightUpperArm = character:FindFirstChild("RightUpperArm")

    if leftArm and rightArm then
        local originalLeftArmSize = leftArm.Size
        local originalRightArmSize = rightArm.Size

        leftArm.Size = Vector3.new(originalLeftArmSize.X, originalLeftArmSize.Y * scaleFactor, originalLeftArmSize.Z)
        rightArm.Size = Vector3.new(originalRightArmSize.X, originalRightArmSize.Y * scaleFactor, originalRightArmSize.Z)

        leftArm.CFrame = leftArm.CFrame * CFrame.new(0, (leftArm.Size.Y - originalLeftArmSize.Y) / 2, 0)
        rightArm.CFrame = rightArm.CFrame * CFrame.new(0, (rightArm.Size.Y - originalRightArmSize.Y) / 2, 0)
    end

    if leftLowerArm and rightLowerArm and leftUpperArm and rightUpperArm then
        local originalLeftLowerArmSize = leftLowerArm.Size
        local originalRightLowerArmSize = rightLowerArm.Size
        local originalLeftUpperArmSize = leftUpperArm.Size
        local originalRightUpperArmSize = rightUpperArm.Size

        leftLowerArm.Size = Vector3.new(originalLeftLowerArmSize.X, originalLeftLowerArmSize.Y * scaleFactor, originalLeftLowerArmSize.Z)
        rightLowerArm.Size = Vector3.new(originalRightLowerArmSize.X, originalRightLowerArmSize.Y * scaleFactor, originalRightLowerArmSize.Z)
        leftUpperArm.Size = Vector3.new(originalLeftUpperArmSize.X, originalLeftUpperArmSize.Y * scaleFactor, originalLeftUpperArmSize.Z)
        rightUpperArm.Size = Vector3.new(originalRightUpperArmSize.X, originalRightUpperArmSize.Y * scaleFactor, originalRightUpperArmSize.Z)

        local lowerArmAdjustment = (leftLowerArm.Size.Y - originalLeftLowerArmSize.Y) / 2
        local upperArmAdjustment = (leftUpperArm.Size.Y - originalLeftUpperArmSize.Y) / 2

        leftLowerArm.CFrame = leftLowerArm.CFrame * CFrame.new(0, lowerArmAdjustment, 0)
        rightLowerArm.CFrame = rightLowerArm.CFrame * CFrame.new(0, lowerArmAdjustment, 0)
        leftUpperArm.CFrame = leftUpperArm.CFrame * CFrame.new(0, lowerArmAdjustment, 0)
        rightUpperArm.CFrame = rightUpperArm.CFrame * CFrame.new(0, lowerArmAdjustment, 0)
    end
end

local scaleFactor = 7

LocalPlayer.CharacterAdded:Connect(function(character)
    wait(1)
    extendArms(character, scaleFactor)
end)

if LocalPlayer.Character then
    extendArms(LocalPlayer.Character, scaleFactor)
end
end,
})

Window:AddSlider({
	Title = "Long Arms Scale",
	Description = "Scale",
	Tab = Player,
	MaxValue = 5,
	Callback = function(Amount) 
		warn(Amount);
	local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function extendArms(character, scaleFactor)
    local leftArm = character:FindFirstChild("Left Arm")
    local rightArm = character:FindFirstChild("Right Arm")

    local leftLowerArm = character:FindFirstChild("LeftLowerArm")
    local rightLowerArm = character:FindFirstChild("RightLowerArm")
    local leftUpperArm = character:FindFirstChild("LeftUpperArm")
    local rightUpperArm = character:FindFirstChild("RightUpperArm")

    if leftArm and rightArm then
        local originalLeftArmSize = leftArm.Size
        local originalRightArmSize = rightArm.Size

        leftArm.Size = Vector3.new(originalLeftArmSize.X, originalLeftArmSize.Y * scaleFactor, originalLeftArmSize.Z)
        rightArm.Size = Vector3.new(originalRightArmSize.X, originalRightArmSize.Y * scaleFactor, originalRightArmSize.Z)

        leftArm.CFrame = leftArm.CFrame * CFrame.new(0, (leftArm.Size.Y - originalLeftArmSize.Y) / 2, 0)
        rightArm.CFrame = rightArm.CFrame * CFrame.new(0, (rightArm.Size.Y - originalRightArmSize.Y) / 2, 0)
    end

    if leftLowerArm and rightLowerArm and leftUpperArm and rightUpperArm then
        local originalLeftLowerArmSize = leftLowerArm.Size
        local originalRightLowerArmSize = rightLowerArm.Size
        local originalLeftUpperArmSize = leftUpperArm.Size
        local originalRightUpperArmSize = rightUpperArm.Size

        leftLowerArm.Size = Vector3.new(originalLeftLowerArmSize.X, originalLeftLowerArmSize.Y * scaleFactor, originalLeftLowerArmSize.Z)
        rightLowerArm.Size = Vector3.new(originalRightLowerArmSize.X, originalRightLowerArmSize.Y * scaleFactor, originalRightLowerArmSize.Z)
        leftUpperArm.Size = Vector3.new(originalLeftUpperArmSize.X, originalLeftUpperArmSize.Y * scaleFactor, originalLeftUpperArmSize.Z)
        rightUpperArm.Size = Vector3.new(originalRightUpperArmSize.X, originalRightUpperArmSize.Y * scaleFactor, originalRightUpperArmSize.Z)

        local lowerArmAdjustment = (leftLowerArm.Size.Y - originalLeftLowerArmSize.Y) / 2
        local upperArmAdjustment = (leftUpperArm.Size.Y - originalLeftUpperArmSize.Y) / 2

        leftLowerArm.CFrame = leftLowerArm.CFrame * CFrame.new(0, lowerArmAdjustment, 0)
        rightLowerArm.CFrame = rightLowerArm.CFrame * CFrame.new(0, lowerArmAdjustment, 0)
        leftUpperArm.CFrame = leftUpperArm.CFrame * CFrame.new(0, lowerArmAdjustment, 0)
        rightUpperArm.CFrame = rightUpperArm.CFrame * CFrame.new(0, lowerArmAdjustment, 0)
    end
end

local scaleFactor = 7

LocalPlayer.CharacterAdded:Connect(function(character)
    wait(1)
    extendArms(character, scaleFactor)
end)

if LocalPlayer.Character then
    extendArms(LocalPlayer.Character, scaleFactor)
end
end,
})

Window:AddToggle({
	Title = "WalkSpeed",
	Description = "Walkspeed",
	Tab = Physics,
	Callback = function(Boolean) 
		warn(Boolean);
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23
end,

})

Window:AddSlider({
	Title = "Walkspeed",
	Description = "Wall",
	Tab = Physics,
	MaxValue = 23,
	Callback = function(Amount) 
		warn(Amount);
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23
end,
})

Window:AddToggle({
	Title = "JumpPower",
	Description = "Jumpower",
	Tab = Physics,
	Callback = function(Boolean) 
		warn(Boolean);
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 85 
end,
})

Window:AddSlider({
	Title = "JumpPower",
	Description = "Wall",
	Tab = Physics,
	MaxValue = 85,
	Callback = function(Amount) 
		warn(Amount);
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 85
end,
})

Window:AddToggle({
	Title = "Ball Landing Prediction",
	Description = "Ball Land",
	Tab = Visuals,
	Callback = function(Boolean) 
		warn(Boolean);
	FootballLandingPredictions = true


local function beamProjectile(g, v0, x0, t1)
    
    local c = 0.5 * 0.5 * 0.5
    local p3 = 0.5 * g * t1 * t1 + v0 * t1 + x0
    local p2 = p3 - (g * t1 * t1 + v0 * t1) / 3
    local p1 = (c * g * t1 * t1 + 0.5 * v0 * t1 + x0 - c * (x0 + p3)) / (3 * c) - p2

    
    local curve0 = (p1 - x0).magnitude
    local curve1 = (p2 - p3).magnitude

    
    local b = (x0 - p3).unit
    local r1 = (p1 - x0).unit
    local u1 = r1:Cross(b).unit
    local r2 = (p2 - p3).unit
    local u2 = r2:Cross(b).unit
    b = u1:Cross(r1).unit

    local cf1 = CFrame.new(
        x0.x, x0.y, x0.z,
        r1.x, u1.x, b.x,
        r1.y, u1.y, b.y,
        r1.z, u1.z, b.z
    )

    local cf2 = CFrame.new(
        p3.x, p3.y, p3.z,
        r2.x, u2.x, b.x,
        r2.y, u2.y, b.y,
        r2.z, u2.z, b.z
    )

    return curve0, -curve1, cf1, cf2
end

local predictionColor = Color3.fromRGB(255, 255, 255)
local eventConnection

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local RunService = game:GetService("RunService")

eventConnection = workspace.ChildAdded:Connect(function(b)
    if b.Name == "Football" and b:IsA("BasePart") then
        task.wait()
        local vel = b.Velocity
        local pos = b.Position
        local c0, c1, cf1, cf2 = beamProjectile(Vector3.new(0, -28, 0), vel, pos, 10)
        local beam = Instance.new("Beam")
        local a0 = Instance.new("Attachment")
        local a1 = Instance.new("Attachment")
        beam.Color = ColorSequence.new(predictionColor)
        beam.Transparency = NumberSequence.new(0, 0)
        beam.CurveSize0 = c0
        beam.CurveSize1 = c1
        beam.Name = "Hitbox"
        beam.Parent = workspace.Terrain
        beam.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.01, 0),
            NumberSequenceKeypoint.new(1, 0),
            NumberSequenceKeypoint.new(1, 0.01),
        })
        beam.Segments = 1750
        a0.Parent = workspace.Terrain
        a1.Parent = workspace.Terrain
        a0.CFrame = a0.Parent.CFrame:Inverse() * cf1
        a1.CFrame = a1.Parent.CFrame:Inverse() * cf2
        beam.Attachment0 = a0
        beam.Attachment1 = a1
        beam.Width0 = 1
        beam.Width1 = 1
        
        
        local landedConnection
        landedConnection = RunService.Heartbeat:Connect(function()
            if b.Velocity.magnitude < 1 then  
                beam:Destroy()
                a0:Destroy()
                a1:Destroy()
                landedConnection:Disconnect()
            end
        end)
        
        repeat task.wait() until b.Parent ~= workspace
        beam:Destroy()
        a0:Destroy()
        a1:Destroy()
    end
end)
end,
})

Window:AddToggle({
	Title = "Mag Hitbox Visualizer",
	Description = "Coming soon",
	Tab = Visuals,
	Callback = function(Boolean) 
		warn(Boolean);
	end,
})

Window:AddToggle({
	Title = "Studs",
	Description = "Coming Soon",
	Tab = Visuals,
	Callback = function(Boolean) 
		warn(Boolean);
	end,
})

Window:AddKeybind({
	Title = "Keybind",
	Description = "Binding",
	Tab = Main,
	Callback = function(Key) 
		warn("Key Set")
	end,
}) 

--// Tab [SETTINGS]
local Keybind = nil
local Settings = Window:AddTab({
	Title = "Settings",
	Section = "Settings",
	Icon = "rbxassetid://11293977610",
})

Window:AddKeybind({
	Title = "Minimize Keybind",
	Description = "Set the keybind for Minimizing",
	Tab = Settings,
	Callback = function(Key) 
		Window:SetSetting("Keybind", Key)
	end,
}) 

Window:AddDropdown({
	Title = "Set Theme",
	Description = "Set the theme of the library!",
	Tab = Settings,
	Options = {
		["Light Mode"] = "Light",
		["Dark Mode"] = "Dark",
		["Extra Dark"] = "Void",
	},
	Callback = function(Theme) 
		Window:SetTheme(Themes[Theme])
	end,
}) 

Window:AddToggle({
	Title = "UI Blur",
	Description = "If enabled, must have your Roblox graphics set to 8+ for it to work",
	Default = true,
	Tab = Settings,
	Callback = function(Boolean) 
		Window:SetSetting("Blur", Boolean)
	end,
}) 


Window:AddSlider({
	Title = "UI Transparency",
	Description = "Set the transparency of the UI",
	Tab = Settings,
	AllowDecimals = true,
	MaxValue = 1,
	Callback = function(Amount) 
		Window:SetSetting("Transparency", Amount)
	end,
}) 

Window:Notify({
	Title = "Free Version!",
	Description = "Press Left Alt to Minimize and Open the tab!", 
	Duration = 10
})

if not LPH_OBFUSCATED then
	getfenv().LPH_NO_VIRTUALIZE = function(func) return func end
	getfenv().LPH_JIT_MAX = function(func) return func end
end

LPH_JIT_MAX(function()
	local Hooks, Targets, Whitelisted = {}, {}, {
		{655, 775, 724, 633, 891},
		{760, 760, 771, 665, 898},
		{660, 759, 751, 863, 771},
	}

	-- Function to compare the equality of two tables
	local function AreTablesEqual(a, b)
		if #a ~= #b then return false end
		for i, v in ipairs(a) do
			if b[i] ~= v then return false end
		end
		return true
	end

	LPH_NO_VIRTUALIZE(function()
		-- Scan garbage collected objects for target functions and metatables
		for _, obj in ipairs(getgc(true)) do
			if type(obj) == "function" then
				local scriptSource, lineNumber = debug.info(obj, "sl")
				if scriptSource:find("PlayerModule.LocalScript") and table.find({42, 51, 61}, lineNumber) then
					table.insert(Targets, obj)
				end
			elseif type(obj) == "table" and rawlen(obj) == 19 and getrawmetatable(obj) then
				Targets.__call = rawget(getrawmetatable(obj), "__call")
			end
		end
	end)()

	-- Validate that all necessary targets are found
	if not (Targets[1] and Targets[2] and Targets[3] and Targets.__call) then
		warn("Bypass initialization failed")
		return
	end

	local scriptIdentifier = debug.info(Targets[1], "s")

	-- Hook the debug.info function to return the spoofed script path
	Hooks.debug_info = hookfunction(debug.info, LPH_NO_VIRTUALIZE(function(...)
		local args = {...}
		if not checkcaller() and AreTablesEqual(args, {2, "s"}) then
			return scriptIdentifier
		end
		return Hooks.debug_info(...)
	end))

	-- Neutralize the identified functions by hooking them to empty functions
	for i = 1, 3 do
		hookfunction(Targets[i], LPH_NO_VIRTUALIZE(function() end))
	end

	-- Hook the __call metamethod to allow only whitelisted calls
	Hooks.__call = hookfunction(Targets.__call, LPH_NO_VIRTUALIZE(function(self, ...)
		local callArgs = {...}
		for _, whitelist in ipairs(Whitelisted) do
			if AreTablesEqual(whitelist, callArgs) then
				return Hooks.__call(self, ...)
			end
		end
	end))

	task.wait(3)
end)()
