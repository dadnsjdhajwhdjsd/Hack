local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "MM2",
    SubTitle = "idk you do with this. dont use it for other games.",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "app-window" }),
    Murderer = Window:AddTab({ Title = "Murderer", Icon = "utensils" }),
    Sheriff = Window:AddTab({ Title = "Sheriff", Icon = "target" ]),
    Farm = Window:AddTab({ Title = "Farms", Icon = "tractor" ]),
}

local Options = Fluent.Options

do 

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
                            loadstring(game:HttpGet"https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")()
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
                            loadstring(game:HttpGet"https://raw.githubusercontent.com/dadnsjdhajwhdjsd/Hack/refs/heads/main/src/eclipse%20but%20better.lua")()
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
        Description = "Loads",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "Pick lol",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet"https://raw.githubusercontent.com/vexroxd/My-Script-/refs/heads/main/MM2-Candy-Farm")()
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

