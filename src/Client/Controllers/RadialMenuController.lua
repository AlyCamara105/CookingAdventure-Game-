-- Radial Menu Controller
-- Username
-- May 30, 2021



local RadialMenuController = {}


function RadialMenuController:Start()
	
end

local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local player = game.Players.LocalPlayer

repeat
    wait()
until player.Character

local RaduilMenuScreenGui = player.PlayerGui.RadialMenu

local RadiulMenuComponents = {

    {"Knife"},
    {"Pan"},
    {"Inventory"},
    {"Achievements"},
    {"StorageKey"},
    {"Notebook"},
    {"Settings"},
    {"Map"}

}

for index, TableValue in ipairs(RadiulMenuComponents) do

    for index, gui in ipairs(RaduilMenuScreenGui:GetChildren()) do -- Edits the dictionary for the gui with the info 

        if TableValue[1] == gui.Name then

            table.insert(TableValue, gui)
            table.insert(TableValue, gui.Position)
        
        end

    end

end

for index, gui in ipairs(RaduilMenuScreenGui:GetChildren()) do --Makes all the gui in the same position

    gui.Position = RadiulMenuComponents[1][3]

end

function TweenGui(gui, Time, delayTime, Position) -- Controls the tweening of the gui's'

    local goal = {}
    goal.Position = Position

    local tweeninfo = TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, delayTime)

    local tween = TS:Create(gui, tweeninfo, goal)

    tween:Play()

    wait(Time)

end

UIS.InputBegan:Connect(function(input, gpe)

    if gpe then 
        return 
    else

        if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.P then

            for index, Table in ipairs(RadiulMenuComponents) do -- Calls the function to tween all gui

                TweenGui(Table[2], 1, 0, Table[3])

                local place = table.find(RadiulMenuComponents, Table) + 1
                for i = place, #RadiulMenuComponents do

                    --RadiulMenuComponents[i][2].Position = RadiulMenuComponents[place][3]
                    --Make it so that instead of it already placing the next gui there it tweens it there and carries the rest with it at the same time

                end

            end

        end

    end

end)

--[[
    To be Done:
        - Make the turning aspect of the gui tweening (Make sure to make it interruptable)
        - Make it so that the gui gets smaller on mouse hover and bigger on mouse click (Make Compatible for Mobile!)
        - Make it so that the Radial Menu is triggered from a specific key (TBD)
]]

function RadialMenuController:Init()
	
end


return RadialMenuController