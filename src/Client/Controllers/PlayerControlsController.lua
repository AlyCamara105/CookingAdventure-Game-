-- Player Controls Controller
-- Username
-- July 16, 2021



local PlayerControlsController = {}


function PlayerControlsController:Start()

    local UIS = game:GetService("UserInputService")
    local RP = game:GetService("ReplicatedStorage")
    local player = game.Players.LocalPlayer

    repeat
        wait()
    until player.Character

    wait(1)

    local PCmodule = self.Modules.PlayerControlsModule

    PCmodule:LoadAnimations()

    local CrouchHotKey = Enum.KeyCode.C

    UIS.InputEnded:Connect(function(input, gpe)
    
        if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == CrouchHotKey then

            PCmodule:PlayOrStopCrouchAnimation()

        end
    
    end)
	
end


function PlayerControlsController:Init()
	
end


return PlayerControlsController