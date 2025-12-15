function getCurrentPlayerCount()
    return #game.Players:GetPlayers()
end
function getMaxPlayerCount()
    return game.Players.MaxPlayers
end
function getClientPing()
    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
    return math.floor(ping + 0.5)
end

local fps = 0
local lastTick = tick()
game:GetService("RunService").Heartbeat:Connect(function()
    local currentTick = tick()
    fps = 1 / (currentTick - lastTick)
    lastTick = currentTick
end)

function getFPS()
    return math.floor(fps + 0.5)
end

function getPlaceID()
    return game.PlaceId
end

function getPlaceName()
    return game.Place.Name
end

function getServerID()
    return game.JobId
end
local function getClientUptime()
    return tick()
end

function clearChat()
    local clearMessage = ""
    for i = 1, 20 do
        clearMessage = clearMessage .. " "
    end

    for i = 1, 30 do
        pcall(function()
            game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
                Text = clearMessage,
                Color = Color3.new(1, 1, 1), 
                Font = Enum.Font.SourceSans,
                FontSize = Enum.FontSize.Size18,
            })
        end)
        pcall(function()
            game.TextChatService.TextChannels.RBXSystem:DisplaySystemMessage("‎")
        end)
    end
end

-- SCRIPT STARTS HERE

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Crazy universal script", "GrapeTheme")

local STab = Window:NewTab("Scripts")
local GSection = STab:NewSection("Games")

GSection:NewButton("Mm2", "Script for mm2", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
end)

GSection:NewButton("Rivals", "Script for Rivals", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/8bits4ya/rivals-v3/refs/heads/main/main.lua"))()
end)

GSection:NewButton("Flee The Facility", "Script for Flee The Facility", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/B-Xs/FPlus/refs/heads/main/Loader"))()
end)

GSection:NewButton("Dead Rails", "Script for Dead Rails", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", true))()
end)

GSection:NewButton("K.A.T", "Script for KAT Perm key is in repo", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/zReal-King/Knife-Ability-Test/main/Gui'))()
end)

GSection:NewButton("Blade Ball", "Script for Blade Ball", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/funhaji/Blade-Ball/refs/heads/main/No-Lag.lua", true))()
end)

GSection:NewButton("Fisch", "Script for Fisch", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/RaitoHub/refs/heads/main/Script"))()
end)

local USection = STab:NewSection("Universal")

USection:NewButton("IY", "Infinite Yield script for plenty of purposes", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)

USection:NewButton("Jerk off", "Jerk that thang only with R6. enable inventory with IY if your game has it disabled.", function()
    loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))("Spider Script")
end)

USection:NewButton("Fling gui toggle", "Script to press a button and go vroom", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelaxiz/megasecretrepothatdoesnthaveanythingthatbadthisisonlyfortestinglmao/refs/heads/main/TOGGLEFLING.lua"))()
end)

USection:NewButton("Fake lag", "Fake lag Gui only two buttons but the creator made it a mess so i dont recommend using mobile", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Fe%20Fake%20Lag%20Obfuscator'))()
end)

USection:NewButton("Rochip", "Universal kinda good gui", function()
    loadstring(game:HttpGet('https://glot.io/snippets/gzrux646yj/raw/main.ts'))()
end)

USection:NewButton("FLY", "Universal fly button gui", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

USection:NewButton("Click Tp", "TP tool", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Click%20TP%20Tool.lua"))()
end)

local UTab = Window:NewTab("Universal stuff")
local PSection = UTab:NewSection("Player")

PSection:NewSlider("Walkspeed", "Changes the walkspeed", 100, 1, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

PSection:NewButton("Reset Walkspeed", "Revert it back to the default 16", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)

PSection:NewSlider("Jumppower", "Changes the jumppower", 250, 50, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)

PSection:NewButton("Reset JumpP", "Revert it back to the default 50", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)

PSection:NewSlider("Gravity", "Changes the gravity", 250, 0, function(v)
    game.Workspace.Gravity = v
end)

PSection:NewButton("Reset Gravity", "Revert it back to the default 196.2", function()
    game.Workspace.Gravity = 196.2
end)

PSection:NewToggle("InfJump", "Toggle Infinitejump", function(state)
    if state then
        local UIS = game:GetService("UserInputService")
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

        local jumpConnection
        local flying = false

        jumpConnection = UIS.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.Space or input.UserInputType == Enum.UserInputType.Touch then
                flying = true
                while flying do
                    if humanoid then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                    wait(0.005)
                end
            end
        end)

        UIS.InputEnded:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.Space or input.UserInputType == Enum.UserInputType.Touch then
                flying = false
            end
        end)

        -- Store the connections so we can disconnect them when the toggle is off
        _G.JumpConnection = jumpConnection
        
    else
        if _G.JumpConnection then
            _G.JumpConnection:Disconnect()
            _G.JumpConnection = nil
        end
    end
end)

local BSection = UTab:NewSection("Aimbot")



local fov = 150
local smoothing = 1
local teamCheck = false

BSection:NewToggle("Teamcheck", "Bypasses aimbot from locking teammates", function(state)
    if state then
        teamCheck = true
    else
        teamCheck = false
    end
end)

       

local RunService = game:GetService("RunService")

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 1.5
FOVring.Radius = fov
FOVring.Transparency = 1
FOVring.Color = Color3.fromRGB(255, 128, 128)
FOVring.Position = workspace.CurrentCamera.ViewportSize/2

local function getClosest(cframe)
   local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
   
   local target = nil
   local mag = math.huge
   
   for i,v in pairs(game.Players:GetPlayers()) do
       if v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v ~= game.Players.LocalPlayer and (v.Team ~= game.Players.LocalPlayer.Team or (not teamCheck)) then
           local magBuf = (v.Character.Head.Position - ray:ClosestPoint(v.Character.Head.Position)).Magnitude
           
           if magBuf < mag then
               mag = magBuf
               target = v
           end
       end
   end
   
   return target
end

local loop

local function enableAimbot()
   loop = RunService.RenderStepped:Connect(function()
       local UserInputService = game:GetService("UserInputService")
       local pressed = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
       local localPlay = game.Players.localPlayer.Character
       local cam = workspace.CurrentCamera
       local zz = workspace.CurrentCamera.ViewportSize/2
   
       if pressed then
           local Line = Drawing.new("Line")
           local curTar = getClosest(cam.CFrame)
           local ssHeadPoint = cam:WorldToScreenPoint(curTar.Character.Head.Position)
           ssHeadPoint = Vector2.new(ssHeadPoint.X, ssHeadPoint.Y)
           if (ssHeadPoint - zz).Magnitude < fov then
               workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(cam.CFrame.Position, curTar.Character.Head.Position), smoothing)
           end
       end
   
       if UserInputService:IsKeyDown(Enum.KeyCode.Delete) then
           disableAimbot()
       end
   end)
end

local function disableAimbot()
   if loop then
       loop:Disconnect()
       loop = nil
   end
   FOVring:Remove()
end

BSection:NewToggle("Aimbot", "Press right click", function(state)
    if state then
        enableAimbot()
    else
        disableAimbot()
    end
end)









local OSection = UTab:NewSection("Other")

local espEnabled = false
local espConnections = {}

local function removeESP(player)
    if player.Character then
        for _, v in ipairs(player.Character:GetChildren()) do
            if v:IsA("Highlight") or v:IsA("BillboardGui") then
                v:Destroy()
            end
        end
    end
end

local function createESP(player)
    if not espEnabled then return end
    if player == game.Players.LocalPlayer then return end

    local function apply(character)
        removeESP(player)

        -- Highlight
        local highlight = Instance.new("Highlight")
        highlight.FillColor = Color3.fromRGB(0, 255, 0)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.Parent = character

        -- Name tag
        local nameTag = Instance.new("BillboardGui")
        nameTag.Name = "ESP_Name"
        nameTag.Size = UDim2.new(0, 100, 0, 40)
        nameTag.StudsOffset = Vector3.new(0, 2.5, 0)
        nameTag.AlwaysOnTop = true
        nameTag.Parent = character

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = player.Name
        label.TextColor3 = Color3.new(1, 1, 1)
        label.TextScaled = true
        label.Parent = nameTag
    end

    if player.Character then
        apply(player.Character)
    end

    espConnections[player] = player.CharacterAdded:Connect(function(char)
        if espEnabled then
            apply(char)
        end
    end)
end

-- Handle players who join AFTER you
game.Players.PlayerAdded:Connect(function(player)
    createESP(player)
end)

-- ESP toggle
OSection:NewToggle("Toggle Esp", "Esp toggle", function(state)
    espEnabled = state

    if state then
        -- APPLY ESP TO ALL CURRENT PLAYERS
        for _, player in ipairs(game.Players:GetPlayers()) do
            createESP(player)
        end
    else
        -- REMOVE ESP + CLEAN CONNECTIONS
        for _, player in ipairs(game.Players:GetPlayers()) do
            removeESP(player)
            if espConnections[player] then
                espConnections[player]:Disconnect()
                espConnections[player] = nil
            end
        end
    end
end)




local noclipConnection

PSection:NewToggle("Toggle noclip", "Hint: after turning off, jump", function(state)
   local player = game.Players.LocalPlayer
   local character = player.Character or player.CharacterAdded:Wait()
   
   if state then
      -- Enable noclip
      local function noclip()
         for _, v in pairs(character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide and v.Name ~= "Left Leg" and v.Name ~= "Right Leg" and v.Name ~= "Torso" then
               v.CanCollide = false
            end
         end
      end

      -- Call noclip function and set up a loop to keep noclip active
      noclip()
      noclipConnection = game:GetService("RunService").Stepped:Connect(noclip)
   else
      -- Disable noclip
      local function clip()
         for _, v in pairs(character:GetDescendants()) do
            if v:IsA("BasePart") and not v.CanCollide then
               v.CanCollide = true
            end
         end
      end

      -- Call clip function to re-enable clipping
      clip()

      -- Disconnect noclip connection to stop the loop
      if noclipConnection then
         noclipConnection:Disconnect()
         noclipConnection = nil
      end
   end
end)


Statstab = Window:NewTab("Info")
local StatusSection = Statstab:NewSection("Informations")
local maxplayers = getMaxPlayerCount()
local version = StatusSection:NewLabel("Version 1.7")
local credits = StatusSection:NewLabel("4ivid and gela")
local playerlabel = StatusSection:NewLabel("Players: " .. getCurrentPlayerCount() .. "/" .. maxplayers)
local pinglabel = StatusSection:NewLabel("Ping: " .. getClientPing())
local fpslabel = StatusSection:NewLabel("FPS: " .. getFPS())
local placeidlabel = StatusSection:NewLabel("Place ID: " .. getPlaceID())
local copyplaceidbutton = StatusSection:NewButton("Copy Place ID", "Copies the Place ID to your clipboard", function()
    setclipboard(tostring(getPlaceID()))
    bigGreenItalicText("Copied Place ID to clipboard!")
end)
local serveridlabel = StatusSection:NewLabel("Server ID: " .. getServerID())
local copyservidbutton = StatusSection:NewButton("Copy Server ID", "Copies the Server ID to your clipboard", function()
    setclipboard(tostring(getServerID()))
    bigGreenItalicText("Copied Server ID to clipboard!")
end)
task.spawn(function()
    while hyperlibblock do
        playerlabel:UpdateLabel("Players: " .. getCurrentPlayerCount() .. "/" .. maxplayers)
        wait(5)
    end
end)
task.spawn(function()
    while hyperlibblock do
        pinglabel:UpdateLabel("Ping: " .. getClientPing() .. "ms")
        fpslabel:UpdateLabel("FPS: " .. getFPS())
        wait(1)
    end
end)
