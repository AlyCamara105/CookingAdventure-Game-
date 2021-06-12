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

    if gui.Name == "Center" then

        print("")
    else

        local defaultSize = gui.Size
        local EnterScale = 1.5

        local EnterSize = UDim2.new(defaultSize.X.Scale*EnterScale, defaultSize.X.Offset, defaultSize.Y.Scale*EnterScale, defaultSize.Y.Offset)

        gui.Position = RaduilMenuScreenGui.Center.Position
        gui.ImageTransparency = 1

        gui.MouseEnter:Connect(function()

            print("The mouse enterd the gui")
            gui:TweenSizeAndPosition(EnterSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.05, true)
        
        end)

        gui.MouseLeave:Connect(function()

            gui:TweenSizeAndPosition(defaultSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.05, true)
            
        end)

    end

end

function TweenGui(gui, Time, delayTime, Position) -- Controls the tweening of the gui's'

    local goal = {}
    goal.Position = Position
    goal.ImageTransparency = 0

    local tweeninfo = TweenInfo.new(Time, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, delayTime)

    local tween = TS:Create(gui, tweeninfo, goal)

    tween:Play()

    --wait(Time)

end

UIS.InputBegan:Connect(function(input, gpe)

    if gpe then 
        return 
    else

        local TweenTime = 0.05
        local delayTime = 0

        if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.P then

            for index, Table in ipairs(RadiulMenuComponents) do -- Calls the function to tween all gui

                TweenGui(Table[2], TweenTime, delayTime, Table[3])

            end

        end

    end

end)

--[[
    To be Done:
        - Make it so that the gui gets smaller on mouse hover and bigger on mouse click (Make Compatible for Mobile!)
        -Make it so that when you click P again it closes the Radial Menu
        -̶ ̶M̶a̶k̶e̶ ̶i̶t̶ ̶s̶o̶ ̶t̶h̶a̶t̶ ̶t̶h̶e̶ ̶R̶a̶d̶i̶a̶l̶ ̶M̶e̶n̶u̶ ̶i̶s̶ ̶t̶r̶i̶g̶g̶e̶r̶e̶d̶ ̶f̶r̶o̶m̶ ̶a̶ ̶s̶p̶e̶c̶i̶f̶i̶c̶ ̶k̶e̶y̶ ̶(̶T̶B̶D̶)̶
        -Strike through command is Ctrl + K
]]

function RadialMenuController:Init()
	
end


return RadialMenuController