-- Radial Menu Module
-- Username
-- June 17, 2021



local RMmodule = {}

RMmodule.IEmodule = nil

RMmodule.PCmodule = nil

function RMmodule:Start()

    self.IEmodule = self.Modules.ItemEquipperModule

    self.PCmodule = self.Modules.PlayerControlsModule

end

local RP = game:GetService("ReplicatedStorage")
local TS = game:GetService("TweenService")
local player = game.Players.LocalPlayer

-- Click Sound 
RMmodule.ClickSound = RP:WaitForChild("Sounds",1).Click

-- Radial Menu Screen Gui
RMmodule.RadialMenuScreenGui = player.PlayerGui.RadialMenu

-- Mobile buttons Screen Gui
RMmodule.MobileButtonScreenGui = player.PlayerGui.MobileIcons

-- Radial Menu CookingUtencils1 Screen Gui
RMmodule.CookingUtencils1ScreenGui = player.PlayerGui.CookingUtencils1

-- Radial Menu CookingUtencils2 Screen Gui
RMmodule.CookingUtencils2ScreenGui = player.PlayerGui.CookingUtencils2

-- Inventory Frame Gui
RMmodule.InventoryFrame = player.PlayerGui.Inventory.InventoryBackframe

-- Background button (to detect space clicked)
RMmodule.BackgroundSpaceButton = player.PlayerGui.Background.Button

-- Table of buttons to be connected to the button events
RMmodule.AllButtunGui = {

    {"CookingUtencils1"},
    {"CookingUtencils2"},
    {"Inventory"},
    {"Achievements"},
    {"StorageKey"},
    {"Notebook"},
    {"Settings"},
    {"Map"},
    {"RadialMenuButton"},
    {"CrouchIcon"},
    {"DodgerollIcon"},
    {"HandIcon"},
    {"RunIcon"},
    {"BasicKnife"},
    {"MortarStaff"},
    {"Pan"},
    {"Pot"}

}

-- Table of Radial Menu buttons
RMmodule.RadialMenuComponents = {

    {"CookingUtencils1"},
    {"CookingUtencils2"},
    {"Inventory"},
    {"Achievements"},
    {"StorageKey"},
    {"Notebook"},
    {"Settings"},
    {"Map"},

}

-- Table of CookingUtencils1ScreenGui Components
RMmodule.CookingUtencils1ScreenGuiComponents = {

    {"BasicKnife"},
    {"MortarStaff"}

}

-- Table of CookingUtencils2ScreenGui Components
RMmodule.CookingUtencils2ScreenGuiComponents = {

    {"Pan"},
    {"Pot"}

}

RMmodule.MobileIconsScreenGuiComponents = {

    {"CrouchIcon"},
    {"DodgerollIcon"},
    {"HandIcon"},
    {"RunIcon"},

}

-- Table of Special Gui Buttons events
RMmodule.SpecialGuis = {"RadialMenuButton", "CookingUtencils1", "CookingUtencils2", "Inventory", "BasicKnife", "MortarStaff", "Pan",
"Pot", "CrouchIcon", "RunIcon"}

-- Action Events that will be connected for buttons
function RMmodule:ConnectSpecificRadialMenuButton(gui)

    -- When the Radial Menu button is activated it will close or open the radial Menu gui
    if gui.Name == "RadialMenuButton" then

        gui.Activated:Connect(function(InputObject, Clicks)
        
            self:OpenOrCloseRadialMenu()
        
        end)

    -- When the Cooking Utensils 1 gui button is clicked it will close the Radial menu gui and open the Cooking Utencils 1 gui
    elseif gui.Name == "CookingUtencils1" then

        gui.Activated:Connect(function(InputObject, Clicks)

            self:CloseRadialMenu()
            self:OpenCookingUtencils1RadialMenu()
        
        end)

    -- When the Cooking Utensils 2 gui button is clicked it will close the Radial menu gui and open the Cooking Utencils 2 gui
    elseif gui.Name == "CookingUtencils2" then

        gui.Activated:Connect(function(InputObject, Clicks)
        
            self:CloseRadialMenu()
            self:OpenCookingUtencils2RadialMenu()
        
        end)

    -- When the Inventory gui button is clicked it will close the radial menu and open the inventory gui
    elseif gui.Name == "Inventory" then

        gui.Activated:Connect(function(InputObject, Clicks)
        
            self:CloseRadialMenu()
            self:OpenInventory()
        
        end)

    -- When the Basic Knife Button is clicked then call the check knife function from the Item Equipper Module
    elseif gui.Name == "BasicKnife" then

        gui.Activated:Connect(function(InputObject, Clicks)
   
            self:CloseCookingUtencils1RadialMenu()
            self.IEmodule:CheckForBasicKnife()
        
        end)  
        
    -- When the Mortar Staff Button is clicked then call the check mortar staff function from the Item Equipper Module
    elseif gui.Name == "MortarStaff" then

        gui.Activated:Connect(function(InputObject, Clicks)

            self:CloseCookingUtencils1RadialMenu()
            self.IEmodule:CheckForMortar()
        
        end) 

    elseif gui.Name == "Pan" then

        gui.Activated:Connect(function(InputObject, Clicks)

            self:CloseCookingUtencils2RadialMenu()
            self.IEmodule:CheckForPan()
        
        end)

    elseif gui.Name == "Pot" then

        gui.Activated:Connect(function(InputObject, Clicks)
        
            self:CloseCookingUtencils2RadialMenu()
            self.IEmodule:CheckForPot()
        
        end)



    -- Controls mobile button
    elseif gui.Name == "CrouchIcon" then

        gui.Activated:Connect(function(InputObject, Clicks)
        
            self.PCmodule:PlayOrStopCrouchAnimation()
        
        end)

    elseif gui.Name == "RunIcon" then

        gui.Activated:Connect(function(InputObject, Clicks)

            if not self.PCmodule.Running then

                self.PCmodule:StartRunning()

            elseif self.PCmodule.Running then

                self.PCmodule:EndRunning()

            end
        
        end)

    end
    
end

-- Plays sound
function RMmodule:PlayClickSound()

    self.ClickSound:Play()

end

-- Function for normal gui button information
function RMmodule:LoadGuiButtonInformation(TableofGuiComponents, ScreenGui)

    for index, TableValue in ipairs(TableofGuiComponents) do

        for index, gui in ipairs(ScreenGui:GetChildren()) do -- Edits the dictionary for the gui with the info, connects events, and places GUI
    
            if TableValue[1] == gui.Name then
    
                table.insert(TableValue, gui)
                table.insert(TableValue, gui.Position)
                table.insert(TableValue, gui.Size)
    
                gui.Position = self.RadialMenuScreenGui.Center.Position
                gui.ImageTransparency = 1
                gui.Visible = false
                gui.Active = false
            
            end
    
        end
    
    end

end

-- Upload the Position and Size of the gui to the RadialMenuComponents, CookingUtencils1ScreenGuiComponents, and CookingUtencils2ScreenGuiComponents table and then positions the gui
function RMmodule:UploadRadialComponentsDictionaryAndPositionThem()

    self:LoadGuiButtonInformation(self.RadialMenuComponents, self.RadialMenuScreenGui)
    
    self:LoadGuiButtonInformation(self.CookingUtencils1ScreenGuiComponents, self.CookingUtencils1ScreenGui)
    
    self:LoadGuiButtonInformation(self.CookingUtencils2ScreenGuiComponents, self.CookingUtencils2ScreenGui)

end

--Playtime for button effects
RMmodule.ButtonEffectsTime = 0.05

-- Function for normal button effects
function RMmodule:ButtonEffectsDefaults(AllButtonGuiTable, ScreenGuiTable)

    for index, TableValue in ipairs(AllButtonGuiTable) do

        for index, gui in ipairs(ScreenGuiTable) do -- Edits the dictionary for the gui with the info, connects events, and places GUI
    
            if TableValue[1] == gui.Name then

                if table.find(self.SpecialGuis, gui.Name) ~= nil then

                    self:ConnectSpecificRadialMenuButton(gui)

                end
    
                local defaultSize = gui.Size
                local EnterScale = 1.20
                local ClickScale = 0.8
    
                local EnterSize = UDim2.new(defaultSize.X.Scale*EnterScale, defaultSize.X.Offset, defaultSize.Y.Scale*EnterScale, defaultSize.Y.Offset)
    
                local ClickSize = UDim2.new(defaultSize.X.Scale*ClickScale, defaultSize.X.Offset, defaultSize.Y.Scale*ClickScale, defaultSize.Y.Offset)

                gui.MouseEnter:Connect(function()

                    if gui.Active then

                        gui:TweenSizeAndPosition(EnterSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, self.ButtonEffectsTime, false)
                        wait(self.ButtonEffectsTime)
                        gui:TweenSizeAndPosition(defaultSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, self.ButtonEffectsTime, false)
                
                    end

                end)
    
                gui.MouseLeave:Connect(function()
    
                    if gui.Active then

                        gui:TweenSizeAndPosition(defaultSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, self.ButtonEffectsTime, false)
    
                    end

                end)

                gui.Activated:Connect(function(InputObject, Clicks)

                    if gui.Active then

                        gui:TweenSizeAndPosition(ClickSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, self.ButtonEffectsTime, false)
                        RMmodule:PlayClickSound()
                        wait(self.ButtonEffectsTime)
                        gui:TweenSizeAndPosition(defaultSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, self.ButtonEffectsTime, false)

                    end
                
                end)
            
            end
    
        end

    end

end

-- Function that connects the gloabal button events
function RMmodule:ConnectRadialMenuButtonEvents()

    -- Connects the radial menu default button effects
    self:ButtonEffectsDefaults(self.AllButtunGui, self.RadialMenuScreenGui:GetChildren())

    -- Connects the Cooking utencils 1 gui default button effects
    self:ButtonEffectsDefaults(self.AllButtunGui, self.CookingUtencils1ScreenGui:GetChildren())

    -- Connects the Cooking utencils 1 gui default button effects
    self:ButtonEffectsDefaults(self.AllButtunGui, self.CookingUtencils2ScreenGui:GetChildren())

    --Connects the Mobile Icons button default
    self:ButtonEffectsDefaults(self.AllButtunGui, self.MobileButtonScreenGui:GetChildren())
end

-- Connects the mobile button events
function RMmodule:ConnectMobileButtonEvents()

    for index, TableValue in ipairs(self.AllButtunGui) do

        for index, gui in ipairs(self.MobileButtonScreenGui:GetChildren()) do

            if TableValue[1] == gui.Name then

                local defaultSize = gui.Size
                local EnterScale = 1.20
                local ClickScale = 0.8
    
                local EnterSize = UDim2.new(defaultSize.X.Scale*EnterScale, defaultSize.X.Offset, defaultSize.Y.Scale*EnterScale, defaultSize.Y.Offset)
    
                local ClickSize = UDim2.new(defaultSize.X.Scale*ClickScale, defaultSize.X.Offset, defaultSize.Y.Scale*ClickScale, defaultSize.Y.Offset)

                gui.MouseEnter:Connect(function()

                    gui:TweenSizeAndPosition(EnterSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, self.ButtonEffectsTime, false)
                    wait(self.ButtonEffectsTime)
                    gui:TweenSizeAndPosition(defaultSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, self.ButtonEffectsTime, false)
                
                end)
    
                gui.MouseLeave:Connect(function()
    
                    gui:TweenSizeAndPosition(defaultSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, self.ButtonEffectsTime, false)
    
                end)

                gui.Activated:Connect(function(InputObject, Clicks)

                    gui:TweenSizeAndPosition(ClickSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, self.ButtonEffectsTime, false)
                    RMmodule:PlayClickSound()
                    wait(self.ButtonEffectsTime)
                    gui:TweenSizeAndPosition(defaultSize, gui.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, self.ButtonEffectsTime, false)
                
                end)

            end

        end
    
    end

end

-- Whether player opened Radial Menu
RMmodule.OpenedRadialMenu = false

-- Whether player opened CookingUtencils1ScreenGui
RMmodule.OpenedCookingUtencils1ScreenGui = false

-- Whether player opened CookingUtencils2ScreenGui
RMmodule.OpenedCookingUtencils2ScreenGui = false

-- Whether player opened the inventory
RMmodule.OpenedInventory = false

-- Radial Menu Open tween time abd delay time
RMmodule.OpenRadialMenuTweenTime = 0.05
RMmodule.OpenRadialMenuTweenDelayTime = 0

-- Radial Menu close tween time abd delay time
RMmodule.CloseRadialMenuTweenTime = 0.05
RMmodule.CloseRadialMenuTweenDelayTime = 0

-- When the background button is activated call the closing gui function
RMmodule.BackgroundSpaceButton.Activated:Connect(function()

    RMmodule:CloseOpenGui()

end)

-- Changes the visibility of the BackgroundSpaceButton
function RMmodule:ChangeBackgroundSpaceVisibility(boolean)

    self.BackgroundSpaceButton.Visible = boolean

end

-- The math that deals with moving each gui element based on screen size
function RMmodule:ChangeLocationOfGui(Centerpos, Pixeldistance, mouseX, mouseY, ScreenGui, ScreenGuiTableInfo)
    
    local MouseXDiff = nil
    local MouseYDiff = nil
    local XMoveDistance = nil
    local YMoveDistance = nil
    local AddX = nil
    local AddY = nil

    if mouseX >= Centerpos.X then

        MouseXDiff = mouseX - Centerpos.X
        AddX = true

    else

        MouseXDiff = Centerpos.X - mouseX
        AddX = false
    
    end

    if mouseY >= Centerpos.Y then

        MouseYDiff = mouseY - Centerpos.Y
        AddY = true

    else

        MouseYDiff = Centerpos.Y - mouseY
        AddY = false

    end

    XMoveDistance = (MouseXDiff/Centerpos.X) * Pixeldistance

    YMoveDistance = (MouseYDiff/Centerpos.Y) * Pixeldistance

    

    if AddX and AddY then

        for index, GuiInfoTable in ipairs(ScreenGuiTableInfo) do

            local OldPosition = nil

            for index, gui in ipairs(ScreenGui:GetChildren()) do

                if gui.Name == GuiInfoTable[1] then

                    OldPosition = GuiInfoTable[3]

                    gui.Position = UDim2.new(OldPosition.X.Scale, OldPosition.X.Offset + XMoveDistance, OldPosition.Y.Scale, OldPosition.Y.Offset + YMoveDistance )

                    break
                
                end

            end       

        end

    elseif AddX and not AddY then

        for index, GuiInfoTable in ipairs(ScreenGuiTableInfo) do

            local OldPosition = nil

            for index, gui in ipairs(ScreenGui:GetChildren()) do

                if gui.Name == GuiInfoTable[1] then

                    OldPosition = GuiInfoTable[3]

                    gui.Position = UDim2.new(OldPosition.X.Scale, OldPosition.X.Offset + XMoveDistance, OldPosition.Y.Scale, OldPosition.Y.Offset - YMoveDistance )

                    break
                
                end

            end           

        end

    elseif not AddX and AddY then

        for index, GuiInfoTable in ipairs(ScreenGuiTableInfo) do

            local OldPosition = nil

            for index, gui in ipairs(ScreenGui:GetChildren()) do

                if gui.Name == GuiInfoTable[1] then

                    OldPosition = GuiInfoTable[3]

                    gui.Position = UDim2.new(OldPosition.X.Scale, OldPosition.X.Offset - XMoveDistance, OldPosition.Y.Scale, OldPosition.Y.Offset + YMoveDistance )

                    break
                
                end

            end

        end

    elseif not AddX and not AddY then

        for index, GuiInfoTable in ipairs(ScreenGuiTableInfo) do

            local OldPosition = nil

            for index, gui in ipairs(ScreenGui:GetChildren()) do

                if GuiInfoTable[1] == gui.Name then

                    OldPosition = GuiInfoTable[3]

                    gui.Position = UDim2.new(OldPosition.X.Scale, OldPosition.X.Offset - XMoveDistance, OldPosition.Y.Scale, OldPosition.Y.Offset - YMoveDistance )

                    break
                
                end

            end     

        end

    end

end

-- Controls the Gui moving effects. (Discountinued)

--[[RMmodule.BackgroundSpaceButton.MouseMoved:Connect(function(X,Y)

    local AbsolutePos = RMmodule.BackgroundSpaceButton.AbsolutePosition
    local CenterPos = Vector2.new(AbsolutePos.X/2, AbsolutePos.Y/2)
    local PixelDistance = 8

    if RMmodule.OpenedRadialMenu then

        RMmodule:ChangeLocationOfGui(CenterPos, PixelDistance, X, Y, RMmodule.RadialMenuScreenGui, RMmodule.RadialMenuComponents)
    
    elseif RMmodule.OpenedCookingUtencils1ScreenGui then

        RMmodule:ChangeLocationOfGui(CenterPos, PixelDistance, X, Y, RMmodule.CookingUtencils1ScreenGui, RMmodule.CookingUtencils1ScreenGuiComponents)

    elseif RMmodule.OpenedCookingUtencils2ScreenGui then

        RMmodule:ChangeLocationOfGui(CenterPos, PixelDistance, X, Y, RMmodule.CookingUtencils2ScreenGui, RMmodule.CookingUtencils2ScreenGuiComponents)

    end

end)]]

-- The function that will get executed when the background button is activated which closes any open gui
function RMmodule:CloseOpenGui()

    self:GoBackGui()

    if self.OpenedRadialMenu then

        self:CloseRadialMenu()

    end

end

-- Will be inside OpenOrCloseRadial Menu Function thats why can't have the extra if that in the CloseOpenGui function has
-- Closes possible open gui
function RMmodule:GoBackGui()

    if self.OpenedInventory then

        self:CloseInventory()

    end

    if self.OpenedCookingUtencils1ScreenGui then

        self:CloseCookingUtencils1RadialMenu()
    
    end

    if self.OpenedCookingUtencils2ScreenGui then

        self:CloseCookingUtencils2RadialMenu()
    
    end

end

-- Opens the Inventory Frame
function RMmodule:OpenInventory()

    self.InventoryFrame.Visible = true

    self.OpenedInventory = true

    self:ChangeBackgroundSpaceVisibility(true)

end

-- Closes the inventory frame
function RMmodule:CloseInventory()

    self:ChangeBackgroundSpaceVisibility(false)

    self.InventoryFrame.Visible = false
    
    self:OpenIngredientsInventory()
    self:CloseWeaponsInventory()

    self.OpenedInventory = false

end

-- Open the CookingUtencils1 Radial Menu Gui
function RMmodule:OpenCookingUtencils1RadialMenu()

    for index, Table in ipairs(self.CookingUtencils1ScreenGuiComponents) do

        local goal = {}
        goal.Position = Table[3]
        goal.ImageTransparency = 0

        local tweeninfo = TweenInfo.new(self.OpenRadialMenuTweenTime, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, self.OpenRadialMenuTweenDelayTime)

        local tween = TS:Create(Table[2], tweeninfo, goal)

        Table[2].Visible = true

        tween:Play()

        tween.Completed:Connect(function()
        
            Table[2].Active = true
        
        end)

    end

    self.OpenedCookingUtencils1ScreenGui = true

    self:ChangeBackgroundSpaceVisibility(true)

end

-- Close the CookingUtencils1 Radial Menu Gui
function RMmodule:CloseCookingUtencils1RadialMenu()

    self:ChangeBackgroundSpaceVisibility(false)

    for i = #self.CookingUtencils1ScreenGuiComponents, 1, -1 do -- Calls the function to tween all gui

        self.CookingUtencils1ScreenGuiComponents[i][2].Active = false

        local goal = {}
        goal.Position = self.RadialMenuScreenGui.Center.Position
        goal.ImageTransparency = 1

        local tweeninfo = TweenInfo.new(self.CloseRadialMenuTweenTime, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, self.CloseRadialMenuTweenDelayTime)

        local tween = TS:Create(self.CookingUtencils1ScreenGuiComponents[i][2], tweeninfo, goal)

        tween:Play()

        tween.Completed:Connect(function()
        
            self.CookingUtencils1ScreenGuiComponents[i][2].Visible = false
        
        end)

    end

    self.OpenedCookingUtencils1ScreenGui = false

end

-- Open the CookingUtencils2 Radial Menu Gui
function RMmodule:OpenCookingUtencils2RadialMenu()

    for index, Table in ipairs(self.CookingUtencils2ScreenGuiComponents) do

        local goal = {}
        goal.Position = Table[3]
        goal.ImageTransparency = 0

        local tweeninfo = TweenInfo.new(self.OpenRadialMenuTweenTime, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, self.OpenRadialMenuTweenDelayTime)

        local tween = TS:Create(Table[2], tweeninfo, goal)

        Table[2].Visible = true

        tween:Play()

        tween.Completed:Connect(function()
        
            Table[2].Active = true
        
        end)

    end

    self.OpenedCookingUtencils2ScreenGui = true

    self:ChangeBackgroundSpaceVisibility(true)

end

-- Close the CookingUtencils2 Radial Menu Gui
function RMmodule:CloseCookingUtencils2RadialMenu()

    self:ChangeBackgroundSpaceVisibility(false)

    for i = #self.CookingUtencils2ScreenGuiComponents, 1, -1 do -- Calls the function to tween all gui

        self.CookingUtencils2ScreenGuiComponents[i][2].Active = false

        local goal = {}
        goal.Position = self.RadialMenuScreenGui.Center.Position
        goal.ImageTransparency = 1

        local tweeninfo = TweenInfo.new(self.CloseRadialMenuTweenTime, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, self.CloseRadialMenuTweenDelayTime)

        local tween = TS:Create(self.CookingUtencils2ScreenGuiComponents[i][2], tweeninfo, goal)

        tween:Play()

        tween.Completed:Connect(function()
        
            self.CookingUtencils2ScreenGuiComponents[i][2].Visible = false
        
        end)

    end

    self.OpenedCookingUtencils2ScreenGui = false

end

-- Function that controls opening the radial menu
function RMmodule:OpenRadialMenu()

    for index, Table in ipairs(self.RadialMenuComponents) do

        local goal = {}
        goal.Position = Table[3]
        goal.ImageTransparency = 0

        local tweeninfo = TweenInfo.new(self.OpenRadialMenuTweenTime, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, self.OpenRadialMenuTweenDelayTime)

        local tween = TS:Create(Table[2], tweeninfo, goal)

        Table[2].Visible = true

        tween:Play()

        tween.Completed:Connect(function()
        
            Table[2].Active = true
        
        end)

    end

    self.OpenedRadialMenu = true

    self:ChangeBackgroundSpaceVisibility(true)

end

-- Function that controls closing the radial menu
function RMmodule:CloseRadialMenu()

    self:ChangeBackgroundSpaceVisibility(false)

    for i = #self.RadialMenuComponents, 1, -1 do -- Calls the function to tween all gui

        self.RadialMenuComponents[i][2].Active = false

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

-- Function that controls whether to open or close the radial menu
function RMmodule:OpenOrCloseRadialMenu()

    self:GoBackGui()

    if self.OpenedRadialMenu then

        self:CloseRadialMenu()

    elseif not self.OpenedRadialMenu then

        self:OpenRadialMenu()

    end

end

-- Image Id to replace roblox's jump button
RMmodule.CustomJumpButtonImageID = "rbxassetid://7000235365"

-- Function that controls if the device is touch isEnabled
function RMmodule:TouchEnabled()

    self.MobileButtonScreenGui.JumpIcon.Visible = false

    local RobloxJumpButton = player.PlayerGui.TouchGui.TouchControlFrame.JumpButton

    if RobloxJumpButton ~= nil then

        RobloxJumpButton.Image = self.CustomJumpButtonImageID
    
    end

end

-- Function that controls when the device is not touch enabled
function RMmodule:TouchDisabled()

    for i, gui in ipairs(self.MobileButtonScreenGui:GetChildren()) do

        gui.Visible = false

    end

end

-- Whether the Weapons Inventory is open
RMmodule.OpenedWeaponsInventoryFrame = false

-- Whether the Ingredients Inventry is open
RMmodule.OpenedIngredientsInventoryFrame = false

-- Opens the weapons inventory frame
function RMmodule:OpenWeaponsInventory()

    local WeaponsFrame = self.InventoryFrame.Weapons

    WeaponsFrame.Visible = true

    self.OpenedWeaponsInventoryFrame = true

end

-- Closes the weapons inventory frame
function RMmodule:CloseWeaponsInventory()

    local WeaponsFrame = self.InventoryFrame.Weapons

    WeaponsFrame.Visible = false

    self.OpenedWeaponsInventoryFrame = false

end

-- Opens Ingredients Inventory
function RMmodule:OpenIngredientsInventory()

    local IngredientsFrame = self.InventoryFrame.Ingredients

    IngredientsFrame.Visible = true

    self.OpenedIngredientsInventoryFrame = true

end

-- Closes Ingredients Inventory
function RMmodule:CloseIngredientsInventory()

    local IngredientsFrame = self.InventoryFrame.Ingredients

    IngredientsFrame.Visible = false

    self.OpenedIngredientsInventoryFrame = false

end

-- Function that controls the inventory gui
function RMmodule:ConnectInvetoryGuiEvents()

    local WeaponsButton = self.InventoryFrame.WeaponInventory

    local IngredientsButton = self.InventoryFrame.FoodInventory

    WeaponsButton.Activated:Connect(function(input)

        if not self.OpenedWeaponsInventoryFrame then

            self:PlayClickSound()
            self:CloseIngredientsInventory()
            self:OpenWeaponsInventory()

        end   
    
    end)

    IngredientsButton.Activated:Connect(function(input)

        if not self.OpenedIngredientsInventoryFrame then

            self:PlayClickSound()
            self:CloseWeaponsInventory()
            self:OpenIngredientsInventory()

        end
    
    end)
 
end

function RMmodule:OpenOrCloseInventory()

    if self.OpenedInventory then

        self:CloseOpenGui()
    
    elseif not self.OpenedInventory then

        self:CloseOpenGui()

        self:OpenInventory()

    end

end

return RMmodule