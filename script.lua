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
local Window = Library.CreateLib("Crazy universal script by vivid", "GrapeTheme")

local STab = Window:NewTab("Scripts")
local GSection = STab:NewSection("Games")
GSection:NewButton("Mm2", "Script for mm2", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
end)
GSection:NewButton("Rivals", "Script for Rivals", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/8bits4ya/rivals-v3/refs/heads/main/main.lua"))()
end)
GSection:NewButton("Da Hood", "Script for Da Hood", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/khen791/script-khen/refs/heads/main/frost%20remake%20by%20khen.lua", true))()
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

PSection:NewSlider("Walkspeed fast", "Changes the walkspeed", 250, 16, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

PSection:NewSlider("Walkspeed slow", "Changes the walkspeed but slower than the one above", 16, 1, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)


PSection:NewSlider("Jumppower", "Changes the jumppower", 250, 50, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)

PSection:NewSlider("Gravity", "Changes the gravity", 250, 0, function(v)
    game.Workspace.Gravity = v
end)

Statstab = Window:NewTab("Info")
local StatusSection = Statstab:NewSection("Informations")
local maxplayers = getMaxPlayerCount()
local version = StatusSection:NewLabel("Version 1.6")
local credits = StatusSection:NewLabel("4vid and gela")
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
