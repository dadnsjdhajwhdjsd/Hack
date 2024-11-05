local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "MM2 Aurora Hub " .. Fluent.Version,
    SubTitle = "by aurora",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,  -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "app-window" }),
    Farm = Window:AddTab({ Title = "Farm", Icon = "tractor" }),  -- Changed the "Farm" tab icon to "tractor"
    Murderer = Window:AddTab({ Title = "Murderer", Icon = "pocket-knife" }),  -- Added Murderer tab with icon
    Sheriff = Window:AddTab({ Title = "Sheriff", Icon = "user-round" }),  -- Added Sheriff tab with icon
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

-- Notification at the start
Fluent:Notify({
    Title = "You have loaded successfully",
    Content = "Go have fun.",
    SubContent = "gooo",  -- Optional
    Duration = 5  -- Set to nil to make the notification not disappear
})

-- Main Tab Content
Tabs.Main:AddParagraph({
    Title = "MM2 Script",
    Content = "This is a MM2 Script..\nUse this on an alt. please."
})

-- Add Buttons with Dialogs
Tabs.Main:AddButton({
    Title = "Infinite Yield",
    Description = "Loads Infinite Yield",
    Callback = function()
        Window:Dialog({
            Title = "Are you sure?",
            Content = "Load infinite yield",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})

Tabs.Main:AddButton({
    Title = "Eclispe Hub",
    Description = "Loads Eclispe Hub",
    Callback = function()
        Window:Dialog({
            Title = "Are you sure?",
            Content = "Load?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/dadnsjdhajwhdjsd/Hack/refs/heads/main/src/eclipse%20but%20better.lua"))()
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})

-- Murderer Tab: Kill Everyone Button
Tabs.Murderer:AddButton({
    Title = "Kill Everyone",
    Description = "Teleport to every player and kill them.",
    Callback = function()
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then  -- Don't teleport to yourself
                -- Teleport to the player
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    -- Teleport to the player's HumanoidRootPart
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame
                    wait(0.2)  -- Short wait to ensure teleportation happens before the next action

                    -- Equip the knife (slot 1)
                    local backpack = game.Players.LocalPlayer.Backpack
                    local knife = backpack:FindFirstChildOfClass("Tool")
                    if knife then
                        knife.Parent = backpack
                    end

                    -- Kill the player (set health to 0)
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid.Health = 0
                    end
                end
            end
        end
    end
})

-- Sheriff Tab (Can add functionality as needed)
Tabs.Sheriff:AddButton({
    Title = "Equip Gun",
    Description = "Equip the sheriff's gun.",
    Callback = function()
        -- Functionality to equip the gun if needed (similar to the knife function above)
        local backpack = game.Players.LocalPlayer.Backpack
        local gun = backpack:FindFirstChild("SheriffGun")
        if gun then
            gun.Parent = backpack
        end
    end
})

-- SaveManager and InterfaceManager
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

-- Load autoload config if applicable
SaveManager:LoadAutoloadConfig()
