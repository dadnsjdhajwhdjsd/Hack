local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local teleportEnabled = false
local isTeleporting = false

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

      -- Farm

      -- Function to find the CoinContainer
    local function findCoinContainer()
    for _, child in pairs(workspace:GetChildren()) do
        local coinContainer = child:FindFirstChild("CoinContainer")
        if coinContainer then
            return coinContainer
        end
    end
    return nil
end

      local function findNearestCoin(radius)
    local coinContainer = findCoinContainer()
    if not coinContainer then
        print("CoinContainer not found")
        return nil
    end
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local nearestCoin = nil
    local nearestDistance = radius
    for _, coin in pairs(coinContainer:GetChildren()) do
        local distance = (coin.Position - humanoidRootPart.Position).Magnitude
        if distance < nearestDistance then
            nearestCoin = coin
            nearestDistance = distance
        end
    end
    return nearestCoin
end
      
    else
        local coinContainer = findCoinContainer()
        if not coinContainer then
            print("CoinContainer not found")
            return
        end
        local coins = coinContainer:GetChildren()
        if #coins == 0 then
            print("No coins found")
            return
        end
        local randomCoin = coins[math.random(1, #coins)]
        print("Teleporting to random coin")
        isTeleporting = true
        local tween = teleportToCoin(randomCoin)
        tween.Completed:Wait()
        isTeleporting = false
    end
end
            Tabs.Farm:AddButton({
        Title = "Farm Coin",
        Description = "farming yehaha",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "yes ofc",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            local function teleportToCoin(coin)
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(humanoidRootPart, tweenInfo, {CFrame = coin.CFrame})
    tween:Play()
    return tween
end
      local function teleportToNearbyOrRandomCoin()
    if not teleportEnabled or isTeleporting then return end
    local nearbyRadius = 50 -- Adjust this value to change the "nearby" distance
    local nearbyCoin = findNearestCoin(nearbyRadius)
    if nearbyCoin then
        print("Teleporting to nearby coin")
        isTeleporting = true
        local tween = teleportToCoin(nearbyCoin)
        tween.Completed:Wait()
        isTeleporting = false
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


      --- Murderer
