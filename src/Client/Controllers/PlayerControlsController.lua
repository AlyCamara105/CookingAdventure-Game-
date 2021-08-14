-- Player Controls Controller
-- Username
-- July 16, 2021



local PlayerControlsController = {}


function PlayerControlsController:Start()

    local UIS = game:GetService("UserInputService")

    local PCmodule = self.Modules.PlayerControlsModule

    -- Loads the player control animations
    PCmodule:LoadAnimations()

    -- Player Hotkeys
    local CrouchHotKey = Enum.KeyCode.C
    local RunHotKey = Enum.KeyCode.LeftShift

    -- Holds the keys being held down
    local KeysDown = {}

    UIS.InputBegan:Connect(function(input, gpe)

        if not gpe then

            if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == RunHotKey then

                table.insert(KeysDown, RunHotKey)
    
                PCmodule:StartRunning()
    
            end

        end  
    
    end)

    UIS.InputEnded:Connect(function(input, gpe)

        if not gpe then

            if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == CrouchHotKey then

                PCmodule:PlayOrStopCrouchAnimation()
    
            elseif input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == RunHotKey then
    
                local shiftKeyindex = table.find(KeysDown, RunHotKey)
                table.remove(KeysDown, shiftKeyindex)
    
                PCmodule:EndRunning()
    
            end

        end
    
    end)
	
end


function PlayerControlsController:Init()
	
end


return PlayerControlsController