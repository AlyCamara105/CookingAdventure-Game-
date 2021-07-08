-- Animation Controller
-- Username
-- July 7, 2021



local AnimationController = {}


function AnimationController:Start()

    local player = game.Players.LocalPlayer

    repeat
        wait()
    until player.Character

    -- Disables player's movement input and prevents the character from being move from other physics before animations change
    local humanoid = player.Character:WaitForChild("Humanoid",1)
    humanoid.PlatformStand = true
    player.Character.HumanoidRootPart.Anchored = true

    wait(1) --Things may have still not loaded yet

    local AnimateScript = player.Character.Animate

    local runAnim = AnimateScript.run.RunAnim

    local walkAnim = AnimateScript.walk.WalkAnim

    local idle1Anim = AnimateScript.idle.Animation1

    local idle2Anim = AnimateScript.idle.Animation2

    runAnim.AnimationId = "rbxassetid://6970228509"

    walkAnim.AnimationId = runAnim.AnimationId

    idle1Anim.AnimationId = "rbxassetid://6969770148"

    idle2Anim.AnimationId = idle1Anim.AnimationId

    -- Renables the movement input and allows player's character to feel physics
    player.Character.HumanoidRootPart.Anchored = false
    humanoid.PlatformStand = false

    player:GetPropertyChangedSignal("Character"):Connect(function()
    
        self:Start()
    
    end)
	
end


function AnimationController:Init()
	
end


return AnimationController