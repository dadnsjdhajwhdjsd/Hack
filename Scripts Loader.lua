-- Fluent library and addons
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Create Window for the script hub
local Window = Fluent:CreateWindow({
    Title = "Script Loader " .. Fluent.Version,
    SubTitle = "by aurora",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- Set to true for blur effect; set to false to disable blur
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Minimize key
})

-- Fluent provides Lucide Icons: https://lucide.dev/icons/
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),  -- Icon can be customized
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

-- Initial Notification
Fluent:Notify({
    Title = "Please notice",
    Content = "Please run these scripts on an alt account as they may get you banned.",
    SubContent = "", -- Optional
    Duration = 5 -- Set to nil for indefinite duration
})

-- Add a paragraph to the Main Tab
Tabs.Main:AddParagraph({
    Title = "RUN THESE SCRIPTS ON AN ALT ACCOUNT.",
    Content = "Self explanatory."
})

-- Add buttons to the Main Tab for loading scripts
Tabs.Main:AddButton({
    Title = "The Strongest Battlegrounds",
    Description = "Loads the lua script for The Strongest Battlegrounds.",
    Callback = function()
        Window:Dialog({
            Title = "Run the script?",
            Content = "Do you want to run the script?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/dadnsjdhajwhdjsd/Hack/refs/heads/main/scripts/The%20Strongest%20Battlegrounds.lua"))()
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
    Title = "MM2",
    Description = "Loads the lua script for MM2.",
    Callback = function()
        Window:Dialog({
            Title = "Run the script?",
            Content = "Do you want to run the MM2 script?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/dadnsjdhajwhdjsd/Hack/refs/heads/main/scripts/MM2%202%20(testing%20release).lua"))()
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

-- Add-ons: SaveManager and InterfaceManager
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore theme settings for saving
SaveManager:IgnoreThemeSettings()

-- Set up folders for SaveManager and InterfaceManager
SaveManager:SetIgnoreIndexes({})  -- You can add specific indexes to ignore
InterfaceManager:SetFolder("FluentScriptHub")  -- Set folder for InterfaceManager
SaveManager:SetFolder("FluentScriptHub/specific-game")  -- Set folder for SaveManager (specific to game)

-- Build the settings section in the interface
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

-- Automatically select the first tab
Window:SelectTab(1)

-- Final notification to confirm script load
Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded successfully.",
    Duration = 8
})

-- Load any configuration marked for autoload
SaveManager:LoadAutoloadConfig()
