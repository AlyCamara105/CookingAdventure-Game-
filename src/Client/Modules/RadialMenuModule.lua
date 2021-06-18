-- Radial Menu Module
-- Username
-- June 17, 2021



local RMmodule = {}

local TS = game:GetService("TweenService")
local player = game.Players.LocalPlayer

RMmodule.RadialMenuScreenGui = player.PlayerGui.RadialMenu

RMmodule.AllButtunGUi = {

    {"Knife"},
    {"Pan"},
    {"Inventory"},
    {"Achievements"},
    {"StorageKey"},
    {"Notebook"},
    {"Settings"},
    {"Map"},
    {"RadialMenuButton"}

}

RMmodule.RadialMenuComponents = {

    {"Knife"},
    {"Pan"},
    {"Inventory"},
    {"Achievements"},
    {"StorageKey"},
    {"Notebook"},
    {"Settings"},
    {"Map"}

}

RMmodule.GUISTWEENED = {}

function RMmodule:UploadRadialComponentsDictionaryAndPositionThem()

    for index, TableValue in ipairs(self.RadialMenuComponents) do

        for index, gui in ipairs(self.RadialMenuScreenGui:GetChildren()) do -- Edits the dictionary for the gui with the info, connects events, and places GUI
    
            if TableValue[1] == gui.Name then
    
                table.insert(TableValue, gui)
                table.insert(TableValue, gui.Position)
    
                gui.Position = self.RadialMenuScreenGui.Center.Position
                gui.ImageTransparency = 1
                gui.Visible = false
            
            end
    
        end
    
    end

end

function RMmodule:ConnectButtonEvents()

    for index, TableValue in ipairs(self.AllButtunGUi) do

        for index, gui in ipairs(self.RadialMenuScreenGui:GetChildren()) do -- Edits the dictionary for the gui with the info, connects events, and places GUI
    
            if TableValue[1] == gui.Name then
    
                local defaultSize = gui.Size
                local EnterScale = 1.20
                local ClickScale = 0.8
    
                local EnterSize = UDim2.new(defaultSize.X.Scale*EnterScale, defaultSize.X.Offset, defaultSize.Y.Scale*EnterScale, defaultSize.Y.Offset)
    
                local ClickSize = UDim2.new(defaultSize.X.Scale*ClickScale, defaultSize.X.Offset, defaultSize.Y.Scale*ClickScale, defaultSize.Y.Offset)
    
                gui.MouseEnter:Connect(function()
    
                    if table.find(self.GUISTWEENED, gui.Name) == nil then
    
                        gui:TweenSizeAndPosition(EnterSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.05, false)
    
                    end 
                
                end)
    
                gui.MouseLeave:Connect(function()
    
                    if table.find(self.GUISTWEENED, gui.Name) == nil then
    
                        gui:TweenSizeAndPosition(defaultSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.05, false)
    
                    end
    
                end)
    
                gui.MouseButton1Down:Connect(function(x,y)
    
                    if table.find(self.GUISTWEENED, gui.Name) == nil then
    
                        gui:TweenSizeAndPosition(ClickSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.05, false)
    
                    end
                
                end)
    
                gui.MouseButton1Click:Connect(function()
    
                    if table.find(self.GUISTWEENED, gui.Name) == nil then
    
                        gui:TweenSizeAndPosition(defaultSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.05, false)
    
                    end
    
                end)
            
            end
    
        end
    
    end

end

RMmodule.OpenedRadialMenu = false

RMmodule.OpenRadialMenuTweenTime = 0.05
RMmodule.OpenRadialMenuTweenDelayTime = 0

RMmodule.CloseRadialMenuTweenTime = 0.05
RMmodule.CloseRadialMenuTweenDelayTime = 0

function RMmodule:OpenRadialMenu()

    for index, Table in ipairs(self.RadialMenuComponents) do

        local place = #self.GUISTWEENED + 1

        table.insert(self.GUISTWEENED, Table[2].Name)

        local goal = {}
        goal.Position = Table[3]
        goal.ImageTransparency = 0

        local tweeninfo = TweenInfo.new(self.OpenRadialMenuTweenTime, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, self.OpenRadialMenuTweenDelayTime)

        local tween = TS:Create(Table[2], tweeninfo, goal)

        Table[2].Visible = true

        tween:Play()

        tween.Completed:Connect(function()
        
            table.remove(self.GUISTWEENED, place)
        
        end)

    end

    self.OpenedRadialMenu = true

end

function RMmodule:CloseRadialMenu()

    for i = #self.RadialMenuComponents, 1, -1 do -- Calls the function to tween all gui

        local goal = {}
        goal.Position = self.RadialMenuScreenGui.Center.Position
        goal.ImageTransparency = 1

        local tweeninfo = TweenInfo.new(self.CloseRadialMenuTweenTime, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, self.CloseRadialMenuTweenDelayTime)

        local tween = TS:Create(self.RadialMenuComponents[i][2], tweeninfo, goal)

        tween:Play()

        tween.Completed:Connect(function()
        
            self.RadialMenuComponents[i][2].Visible = false
        
        end)

    end

    self.OpenedRadialMenu = false

end

function RMmodule:OpenOrCloseRadialMenu()

    if self.OpenedRadialMenu then

        self:CloseRadialMenu()

    elseif not self.OpenedRadialMenu then

        self:OpenRadialMenu()

    end

end

return RMmodule