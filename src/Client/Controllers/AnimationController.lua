-- Animation Controller
-- Username
-- July 7, 2021



local AnimationController = {}


function AnimationController:Start()

    local player = game.Players.LocalPlayer

    repeat
        wait()
    until player.Character

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
	
end


function AnimationController:Init()
	
end


return AnimationController