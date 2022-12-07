-- Animation Controller
-- Username
-- August 13, 2021



local AnimationController = {}


function AnimationController:Start()

    local player = game.Players.LocalPlayer

    -- Disables player's movement input and prevents the character from being move from other physics before animations change
    local Character = player.Character or player.CharacterAdded:Wait()
    local AnimateScript = Character:WaitForChild("Animate",1)

    local runAnim = AnimateScript.run.RunAnim
    local walkAnim = AnimateScript.walk.WalkAnim
    local idle1Anim = AnimateScript.idle.Animation1
    local idle2Anim = AnimateScript.idle.Animation2
    local jumpAnim = AnimateScript.jump.JumpAnim
    local fallAnim = AnimateScript.fall.FallAnim

    --Setting the animations don't work either...

    runAnim.AnimationId = "rbxassetid://7234531373"
    walkAnim.AnimationId = runAnim.AnimationId
    idle1Anim.AnimationId = "rbxassetid://7233696631"
    idle2Anim.AnimationId = idle1Anim.AnimationId
    jumpAnim.AnimationId = "rbxassetid://7233832458"
    fallAnim.AnimationId = "rbxassetid://7233849630"

    player:GetPropertyChangedSignal("Character"):Connect(function()
    
        self:Start()
    
    end)
	
end


function AnimationController:Init()
	
end


return AnimationController