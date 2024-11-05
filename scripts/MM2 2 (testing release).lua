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
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
    Murderer = Window:AddTab({ Title = "Murderer", Icon = "pocket-knife" }),
    Sheriff = Window:AddTab({ Title = "Sheriff", Icon = "user-round" }),
    Farm = Window:AddTab({ Title = "Farm", Icon = "tractor" })
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

Tabs.Main:AddButton({
    Title = "Nexus Hub",
    Description = "Loads Nexus Hub",
    Callback = function()
        Window:Dialog({
            Title = "Are you sure?",
            Content = "Pick lol",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/vexroxd/My-Script-/refs/heads/main/MM2-Candy-Farm"))()
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

-- Murderer Tab - "Kill Everyone" Button
Tabs.Murderer:AddButton({
    Title = "Kill Everyone",
    Description = "Teleports to every player and kills them.",
    Callback = function()
        -- Equip the knife (Slot 1) and kill all players
        local knife = game.Players.LocalPlayer.Character:FindFirstChild("Knife")  -- Assuming the knife is in the character's inventory
        if knife then
            -- Loop through all players and teleport to them
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Character then
                    -- Teleport to the player
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
                    -- Equip knife and kill
                    game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):TakeDamage(100)  -- Kill player
                end
            end
        else
            print("Knife not found!")
        end
    end
})

-- Murderer Tab - Slider to Expand Hitbox
local HitboxSlider = Tabs.Murderer:AddSlider("HitboxSlider", {
    Title = "Expand Hitbox",
    Description = "Set the size of the murderer hitbox.",
    Default = 2,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Callback = function(size)
        -- Expand the hitbox by resizing the player's character model (example logic)
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.HipWidth = size
            character.Humanoid.HipHeight = size
            character.HumanoidRootPart.Size = Vector3.new(size, size, size)
        end
    end
})

-- Sheriff Tab - Keybind to Equip Gun
local Keybind = Tabs.Sheriff:AddKeybind("EquipGunKeybind", {
    Title = "Equip Gun",
    Mode = "Toggle",  -- Always, Toggle, Hold
    Default = "LeftShift",  -- You can change this to any key
    Callback = function(value)
        if value then
            local sheriff = game.Players.LocalPlayer.Character
            local gun = sheriff:FindFirstChild("Tool")  -- Assuming the gun is a tool in slot 1
            if gun and gun:IsA("Tool") then
                -- Equip the gun
                sheriff.Humanoid:EquipTool(gun)
            else
                print("Sheriff's gun is not available!")
            end
        end
    end,
    ChangedCallback = function(newKey)
        print("Keybind changed to:", newKey)
    end
})

-- Add Slider for Speed
local SpeedSlider = Tabs.Main:AddSlider("SpeedSlider", {
    Title = "WalkSpeed",
    Description = "Set the player's walkspeed",
    Default = 16,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Callback = function(speed)
        -- Change the walk speed of the player
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
    end
})

-- Add Slider for Jump
local JumpSlider = Tabs.Main:AddSlider("JumpSlider", {
    Title = "JumpPower",
    Description = "Set the player's jump power",
    Default = 50,
    Min = 0,
    Max = 200,
    Rounding = 1,
    Callback = function(jumpPower)
        -- Change the jump power of the player
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumpPower
    end
})

-- Farm Tab - Add Nexus Hub Button
Tabs.Farm:AddButton({
    Title = "Nexus Hub",
    Description = "Loads Nexus Hub",
    Callback = function()
        Window:Dialog({
            Title = "Are you sure?",
            Content = "Load Nexus Hub?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/vexroxd/My-Script-/refs/heads/main/MM2-Candy-Farm"))()
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
