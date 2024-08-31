local placeIdToJoin = 13827198708

local function sendNotification(title, text, duration, button1, button2, callback)
    local bindableFunction = Instance.new("BindableFunction")
    bindableFunction.OnInvoke = callback

    game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration,
        Button1 = button1,
        Button2 = button2,
        Callback = bindableFunction
    })
end

if game.PlaceId == placeIdToJoin then
    sendNotification("Thank You", "Thank you for using my script! Enjoy!", 5)
else
    sendNotification("Join Game", "Would you like to join the game with PlaceId: " .. placeIdToJoin .. "?", 10, "Yes", "No", function(buttonClicked)
        if buttonClicked == "Yes" then
            game:GetService("TeleportService"):Teleport(placeIdToJoin, game.Players.LocalPlayer)
        else
            print("Cancelled joining the game.")
        end
    end)
end

if game.PlaceId == 13827198708 then

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

    local executor = identifyexecutor and identifyexecutor() or "Unknown Executor"

    local Window = OrionLib:MakeWindow({
        Name = executor .. " | Auto Farm Script",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "Goodguy29_AutoFarm"
    })

    local MainTab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false,
        ShowTab = true
    })

    local EggTab = Window:MakeTab({
        Name = "Egg",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false,
        ShowTab = true
    })

    local CreditsTab = Window:MakeTab({
        Name = "Credits",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false,
        ShowTab = true
    })

    MainTab:AddToggle({
        Name = "Auto Click",
        Default = false,
        Callback = function(value)
            _G.AutoClick = value
            while _G.AutoClick do
                local clickArgs = {
                    [1] = "Click",
                    [2] = false
                }
                game:GetService("ReplicatedStorage").ClickEvent:FireServer(unpack(clickArgs))
                wait(0.1)
            end
        end
    })

    MainTab:AddToggle({
        Name = "Auto Upgrade",
        Default = false,
        Callback = function(value)
            _G.AutoUpgrade = value
            while _G.AutoUpgrade do
                for i = 2, 10000 do
                    local upgradeArgs = {
                        [1] = game:GetService("ReplicatedStorage").Items.Pencil:FindFirstChild(tostring(i)),
                        [2] = false
                    }
                    game:GetService("ReplicatedStorage").GameClient.Events.RemoteEvent.ClickChangeEvent:FireServer(unpack(upgradeArgs))
                    wait(0.1)
                end
            end
        end
    })

    MainTab:AddToggle({
        Name = "Auto Claim Gifts",
        Default = false,
        Callback = function(value)
            _G.AutoClaimGifts = value
            while _G.AutoClaimGifts do
                for i = 1, 12 do
                    local giftArgs = {
                        [1] = "Reward" .. tostring(i)
                    }
                    game:GetService("ReplicatedStorage").GameClient.Events.RemoteEvent.ClaimGift:FireServer(unpack(giftArgs))
                    wait(0.5)
                end
            end
        end
    })

    MainTab:AddToggle({
        Name = "Auto Rebirth",
        Default = false,
        Callback = function(value)
            _G.AutoRebirth = value
            while _G.AutoRebirth do
                game:GetService("ReplicatedStorage").GameClient.Events.RemoteEvent.RebirthEvent:FireServer()
                wait(1)
            end
        end
    })

    EggTab:AddLabel("Get closer to egg to auto buy it.")

    EggTab:AddToggle({
        Name = "Auto Buy Eggs",
        Default = false,
        Callback = function(value)
            _G.AutoBuyEggs = value
            while _G.AutoBuyEggs do
                if _G.SelectedEgg then
                    local args = {
                        [1] = _G.SelectedEgg,
                        [2] = "Buy1"
                    }
                    game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.BuyEgg:InvokeServer(unpack(args))
                    wait(1)
                else
                    print("No egg selected.")
                end
            end
        end
    })

    EggTab:AddDropdown({
        Name = "Select Egg to Buy",
        Default = "Common Egg",
        Options = {"Common Egg", "W2E1", "W4E1"},
        Callback = function(selected)
            _G.SelectedEgg = selected
        end
    })

    EggTab:AddDropdown({
        Name = "Select World 2 Egg to Buy",
        Default = "W5E1",
        Options = {"W5E1", "W7E1", "W10E1"},
        Callback = function(selected)
            _G.SelectedEgg2 = selected
        end
    })

    EggTab:AddDropdown({
        Name = "Select World 3 Egg to Buy",
        Default = "W11E1",
        Options = {"W11E1", "W13E1", "W16E1"},
        Callback = function(selected)
            _G.SelectedEgg3 = selected
        end
    })

    CreditsTab:AddParagraph("More Updates", "For more updates, join my Discord!")
    CreditsTab:AddParagraph("Current Version 1.0")

    OrionLib:Init()
