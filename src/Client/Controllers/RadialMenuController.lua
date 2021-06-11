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

    RadiulMenuComponents[1][2].Position -= UDim2.new(0,0,0.03,0)

end

for index, gui in ipairs(RaduilMenuScreenGui:GetChildren()) do --Makes all the gui in the same position

    gui.Position = RadiulMenuComponents[1][2].Position
    gui.ImageTransparency = 1

end

function TweenGui(gui, Time, delayTime, Position) -- Controls the tweening of the gui's'

    local goal = {}
    goal.Position = Position
    goal.ImageTransparency = 0

    local tweeninfo = TweenInfo.new(Time, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, 0, false, delayTime)

    local tween = TS:Create(gui, tweeninfo, goal)

    tween:Play()

    wait(Time)

end

UIS.InputBegan:Connect(function(input, gpe)

    if gpe then 
        return 
    else

        local TweenTime = 0.1
        local delayTime = 0

        if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.P then

            for index, Table in ipairs(RadiulMenuComponents) do -- Calls the function to tween all gui

                if index == #RadiulMenuComponents then

                    TweenGui(Table[2], TweenTime, delayTime, Table[3])
                    break

                else
                    
                    TweenGui(Table[2], TweenTime, delayTime, Table[3])
                    RadiulMenuComponents[index+1][2].Position = Table[2].Position

                end

            end

        end

    end

end)

--[[
    To be Done:
        - Make the turning aspect of the gui tweening (Make sure to make it interruptable)
        - Make it so that the gui gets smaller on mouse hover and bigger on mouse click (Make Compatible for Mobile!)
        -̶ ̶M̶a̶k̶e̶ ̶i̶t̶ ̶s̶o̶ ̶t̶h̶a̶t̶ ̶t̶h̶e̶ ̶R̶a̶d̶i̶a̶l̶ ̶M̶e̶n̶u̶ ̶i̶s̶ ̶t̶r̶i̶g̶g̶e̶r̶e̶d̶ ̶f̶r̶o̶m̶ ̶a̶ ̶s̶p̶e̶c̶i̶f̶i̶c̶ ̶k̶e̶y̶ ̶(̶T̶B̶D̶)̶
        -Strike through command is Ctrl + K
]]

function RadialMenuController:Init()
	
end


return RadialMenuController