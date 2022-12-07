-- Proximity Prompt Service
-- Username
-- August 6, 2021



local ProximityPromptService = {Client = {}}


function ProximityPromptService:Start()

    local PPS = game:GetService("ProximityPromptService")

    local function onPromptTriggered(prompt, player)
        
        local object = prompt:GetAttribute("Type")

        if object == "Sink" then
            local sinkModel = prompt:FindFirstAncestorOfClass("Model")
            local particle = sinkModel.SinkWater.SinkWater
            local sound = particle.Parent.WaterFlow
            local particlesState = particle.Enabled

            if particlesState then
                particle.Enabled = false
                sound:Stop()
            else
                particle.Enabled = true
                sound:Play()
            end
        elseif object == "Stove" then
            local placeName = prompt:GetAttribute("Place")
            local igniteSound = prompt:FindFirstAncestorOfClass("Model").StoveIgnite
            local turnOffSound = prompt:FindFirstAncestorOfClass("Model").StoveTurnOff
            local particle = workspace.CookingStation[placeName].StoveFlameParticle.StoveFlames
            local particleState = particle.Enabled

            if particleState then
                particle.Enabled = false
                igniteSound:Stop()
                turnOffSound:Play()
            else
                turnOffSound:Stop()
                igniteSound:Play()
                igniteSound.Ended:Connect(function()
                    particle.Enabled = true
                end)
            end
        elseif object == "Blender" then
            local blenderSound = prompt:FindFirstAncestorOfClass("Model").Blending
            
            if not blenderSound.IsPlaying then
                blenderSound:Play()
            end
        elseif object == "OvenDoorActivation" then
            local Hinge = prompt:FindFirstAncestorOfClass("Model").OvenDoorScreen.HingeConstraint

            if Hinge.TargetAngle == 0 then
                Hinge.TargetAngle = 90
            elseif Hinge.TargetAngle == 90 then
                Hinge.TargetAngle = 0
            end

        end
    end

    PPS.PromptTriggered:Connect(onPromptTriggered)
	
end


function ProximityPromptService:Init()
	
end


return ProximityPromptService