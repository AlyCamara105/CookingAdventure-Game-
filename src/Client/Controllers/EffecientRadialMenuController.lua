-- Effecient Radial Menu Controller
-- Username
-- June 17, 2021



local EffecientRadialMenuController = {}


function EffecientRadialMenuController:Start()

    local UIS = game:GetService("UserInputService")
    local player = game.Players.LocalPlayer
    local RP = game:GetService("ReplicatedStorage")

    if not game:IsLoaded() then
        game.Loaded:Wait()
    end

    for _, screenGui in ipairs(RP.Gui:GetChildren()) do
        screenGui:Clone().Parent = player.PlayerGui
    end

    local RMmodule = self.Modules.GuiController

    RMmodule:UploadRadialComponentsDictionaryAndPositionThem()
    RMmodule:ConnectRadialMenuButtonEvents()
    RMmodule:ConnectInvetoryGuiEvents()

    if UIS.TouchEnabled then
        
        RMmodule:ConnectMobileButtonEvents()
        RMmodule:TouchEnabled()

    else

        RMmodule:TouchDisabled()

    end

    local RadialMenuHotKey = Enum.KeyCode.R

    local InventoryHotKey = Enum.KeyCode.B

    UIS.InputBegan:Connect(function(input, gpe)

        if gpe  then 

            return

        elseif input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == RadialMenuHotKey then

            RMmodule:OpenOrCloseRadialMenu()

        elseif input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == InventoryHotKey then

            RMmodule:OpenOrCloseInventory()

        end

    end)
	
end

function EffecientRadialMenuController:Init()
	
end


return EffecientRadialMenuController