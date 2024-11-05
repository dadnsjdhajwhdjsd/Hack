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

-- Toggle Button example
local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Toggle", Default = false })
Toggle:OnChanged(function()
    print("Toggle changed:", Toggle.Value)
end)

-- Slider
local Slider = Tabs.Main:AddSlider("Slider", {
    Title = "Slider",
    Description = "This is a slider",
    Default = 2,
    Min = 0,
    Max = 5,
    Rounding = 1,
    Callback = function(Value)
        print("Slider changed:", Value)
    end
})
Slider:SetValue(3)

-- Dropdown (Single selection)
local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
    Title = "Dropdown",
    Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
    Multi = false,
    Default = 1,
})

Dropdown:SetValue("four")
Dropdown:OnChanged(function(Value)
    print("Dropdown changed:", Value)
end)

-- MultiDropdown (Multiple selections)
local MultiDropdown = Tabs.Main:AddDropdown("MultiDropdown", {
    Title = "Dropdown (Multiple)",
    Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
    Multi = true,
    Default = {"seven", "twelve"},
})

MultiDropdown:SetValue({"seven", "twelve"})
MultiDropdown:OnChanged(function(Value)
    local Values = {}
    for _, Value in pairs(Value) do
        table.insert(Values, Value)
    end
    print("MultiDropdown changed:", table.concat(Values, ", "))
end)

-- Color Picker
local Colorpicker = Tabs.Main:AddColorpicker("Colorpicker", {
    Title = "Colorpicker",
    Default = Color3.fromRGB(96, 205, 255)
})
Colorpicker:OnChanged(function()
    print("Colorpicker changed:", Colorpicker.Value)
end)

-- Keybind Example
local Keybind = Tabs.Main:AddKeybind("Keybind", {
    Title = "KeyBind",
    Mode = "Toggle",  -- Always, Toggle, Hold
    Default = "LeftControl",
    Callback = function(Value)
        print("Keybind clicked:", Value)
    end,
    ChangedCallback = function(New)
        print("Keybind changed:", New)
    end
})

Keybind:OnClick(function()
    print("Keybind clicked:", Keybind:GetState())
end)

Keybind:SetValue("MB2", "Toggle")  -- Sets keybind to MB2, mode to Hold

-- Input Field Example
local Input = Tabs.Main:AddInput("Input", {
    Title = "Input",
    Default = "Default",
    Placeholder = "Placeholder",
    Numeric = false,  -- Only allows numbers
    Finished = false,  -- Only calls callback when you press enter
    Callback = function(Value)
        print("Input changed:", Value)
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
