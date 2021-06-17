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

local RadialMenuScreenGui = player.PlayerGui.RadialMenu

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

    for index, gui in ipairs(RadialMenuScreenGui:GetChildren()) do -- Edits the dictionary for the gui with the info 

        if TableValue[1] == gui.Name then

            table.insert(TableValue, gui)
            table.insert(TableValue, gui.Position)
        
        end

    end

end

local GUISTWEENED = {}

for index, gui in ipairs(RadialMenuScreenGui:GetChildren()) do --Makes all the gui in the same position

    if gui.Name == "Center" then

        print("")
    else

        gui.Position = RadialMenuScreenGui.Center.Position
        gui.ImageTransparency = 1
        gui.Visible = false

        local defaultSize = gui.Size
        local EnterScale = 1.20
        local ClickScale = 0.8

        local EnterSize = UDim2.new(defaultSize.X.Scale*EnterScale, defaultSize.X.Offset, defaultSize.Y.Scale*EnterScale, defaultSize.Y.Offset)

        local ClickSize = UDim2.new(defaultSize.X.Scale*ClickScale, defaultSize.X.Offset, defaultSize.Y.Scale*ClickScale, defaultSize.Y.Offset)

        gui.MouseEnter:Connect(function()

            if table.find(GUISTWEENED, gui.Name) == nil then

                gui:TweenSizeAndPosition(EnterSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.05, false)

            end 
        
        end)

        gui.MouseLeave:Connect(function()

            if table.find(GUISTWEENED, gui.Name) == nil then

                gui:TweenSizeAndPosition(defaultSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.05, false)

            end

        end)

        gui.MouseButton1Down:Connect(function(x,y)

            if table.find(GUISTWEENED, gui.Name) == nil then

                gui:TweenSizeAndPosition(ClickSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.05, false)

            end
        
        end)

        gui.MouseButton1Click:Connect(function()

            if table.find(GUISTWEENED, gui.Name) == nil then

                gui:TweenSizeAndPosition(defaultSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.05, false)

            end

        end)

    end

end

function TweenGuiStart(gui, Time, delayTime, Position) -- Controls the tweening of the gui's'

    local place = #GUISTWEENED + 1

    table.insert(GUISTWEENED, gui.Name)

    local goal = {}
    goal.Position = Position
    goal.ImageTransparency = 0

    local tweeninfo = TweenInfo.new(Time, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, delayTime)

    local tween = TS:Create(gui, tweeninfo, goal)

    gui.Visible = true

    tween:Play()

    tween.Completed:Connect(function()
    
        table.remove(GUISTWEENED, place)
    
    end)

end

function TweenGuiEnd(gui, Time, delayTime, Position) -- Controls the tweening of the gui's'

    local goal = {}
    goal.Position = Position
    goal.ImageTransparency = 1

    local tweeninfo = TweenInfo.new(Time, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, delayTime)

    local tween = TS:Create(gui, tweeninfo, goal)

    tween:Play()

    tween.Completed:Connect(function()
    
        gui.Visible = false
    
    end)

end

local openedMenu = false

UIS.InputBegan:Connect(function(input, gpe)

    if gpe  then 
        return 

    elseif openedMenu then

        local TweenTime = 0.05
        local delayTime = 0

        if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.R then

            for i = #RadiulMenuComponents, 1, -1 do -- Calls the function to tween all gui

                TweenGuiEnd(RadiulMenuComponents[i][2], TweenTime, delayTime, RadialMenuScreenGui.Center.Position)

            end

            openedMenu = false

        end  
    
    else

        local TweenTime = 0.05
        local delayTime = 0

        if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.R then

            for index, Table in ipairs(RadiulMenuComponents) do -- Calls the function to tween all gui

                TweenGuiStart(Table[2], TweenTime, delayTime, Table[3])

            end

            openedMenu = true

        end

    end

end)

--[[
    To be Done:
        - M̶a̶k̶e̶ ̶i̶t̶ ̶s̶o̶ ̶t̶h̶a̶t̶ ̶t̶h̶e̶ ̶g̶u̶i̶ ̶g̶e̶t̶s̶ ̶s̶m̶a̶l̶l̶e̶r̶ ̶o̶n̶ ̶m̶o̶u̶s̶e̶ ̶h̶o̶v̶e̶r̶ ̶a̶n̶d̶ ̶b̶i̶g̶g̶e̶r̶ ̶o̶n̶ ̶m̶o̶u̶s̶e̶ ̶c̶l̶i̶c̶k̶
        - ̶M̶a̶k̶e̶ ̶i̶t̶ ̶s̶o̶ ̶t̶h̶a̶t̶ ̶w̶h̶e̶n̶ ̶y̶o̶u̶ ̶c̶l̶i̶c̶k̶ ̶P̶ ̶a̶g̶a̶i̶n̶ ̶i̶t̶ ̶c̶l̶o̶s̶e̶s̶ ̶t̶h̶e̶ ̶R̶a̶d̶i̶a̶l̶ ̶M̶e̶n̶u̶
        - M̶a̶k̶e̶ ̶R̶ ̶t̶h̶e̶ ̶K̶e̶y̶C̶o̶d̶e̶ ̶f̶o̶r̶ ̶t̶r̶i̶g̶e̶g̶r̶i̶n̶g̶ ̶R̶a̶d̶i̶a̶l̶ ̶M̶e̶n̶u̶
        - F̶i̶x̶ ̶g̶u̶i̶ ̶b̶l̶o̶c̶k̶i̶n̶g̶ ̶c̶a̶m̶e̶r̶a̶ ̶t̶u̶r̶n̶i̶n̶g̶ ̶b̶u̶g̶
        - F̶i̶x̶ ̶r̶a̶d̶i̶a̶l̶ ̶m̶e̶n̶u̶ ̶m̶i̶s̶c̶o̶n̶f̶i̶g̶u̶r̶a̶t̶i̶o̶n̶ ̶w̶h̶e̶n̶ ̶o̶p̶e̶n̶
        - Add hover GUI
        - Make the Radial Menu mobile compatible
        - Clean up the code and simplify it (Try modules now for prototype????)
        - F̶i̶x̶ ̶t̶h̶e̶ ̶p̶o̶s̶i̶t̶i̶o̶n̶i̶n̶g̶ ̶o̶f̶ ̶t̶h̶e̶ ̶m̶i̶d̶d̶l̶e̶ ̶g̶u̶i̶ ̶i̶m̶a̶g̶e̶ ̶l̶a̶b̶e̶l̶ ̶c̶a̶l̶l̶e̶d̶ ̶"̶C̶e̶n̶t̶e̶r̶"̶
        - M̶a̶k̶e̶ ̶i̶t̶ ̶s̶o̶ ̶t̶h̶a̶t̶ ̶t̶h̶e̶ ̶R̶a̶d̶i̶a̶l̶ ̶M̶e̶n̶u̶ ̶i̶s̶ ̶t̶r̶i̶g̶g̶e̶r̶e̶d̶ ̶f̶r̶o̶m̶ ̶a̶ ̶s̶p̶e̶c̶i̶f̶i̶c̶ ̶k̶e̶y̶ ̶(̶T̶B̶D̶)̶
        - Strike through command is Ctrl + K
]]

function RadialMenuController:Init()
	
end


return RadialMenuController