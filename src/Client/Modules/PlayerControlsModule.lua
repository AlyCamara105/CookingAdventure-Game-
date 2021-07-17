-- Player Controls Module
-- Username
-- July 16, 2021



local PCmodule = {}

local RP = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer

local Animations = RP.Animations
local CrouchWalkCycleAnimation = Animations.CrouchWalkCycle
local CrouchAnimation = Animations.Crouch

local Character = nil
local Humanoid = nil
local Animator = nil

local CrouchWalkCycleAnimationTrack = nil
local CrouchAnimationTrack = nil

PCmodule.RegWalkSpeed = 16
PCmodule.RegJumpHeight = 7.2

PCmodule.Crouching = false
PCmodule.CrouchWalkSpeed = 5
PCmodule.CrouchJumpHeight = 0

--Creating the animation tracks
function PCmodule:LoadAnimations()

    Character = player.Character
    Humanoid = Character.Humanoid
    Animator = Character.Humanoid.Animator

    CrouchWalkCycleAnimationTrack = Animator:LoadAnimation(CrouchWalkCycleAnimation)
    CrouchAnimationTrack = Animator:LoadAnimation(CrouchAnimation)

end

function PCmodule:CrouchRestrictions(bool)

    if bool then

        Humanoid.WalkSpeed = self.CrouchWalkSpeed
        Humanoid.JumpHeight = self.CrouchJumpHeight

    elseif not bool then

        Humanoid.WalkSpeed = self.RegWalkSpeed
        Humanoid.JumpHeight = self.RegJumpHeight

    end

end

--Plays the CrouchAnimationTracks
function PCmodule:PlayOrStopCrouchAnimation()

    if not self.Crouching then

        self.Crouching = true

        self:CrouchRestrictions(true)

        CrouchAnimationTrack:Play()
        
        CrouchAnimationTrack.Stopped:Connect(function()
        
            CrouchWalkCycleAnimationTrack:Play()
        
        end)

    elseif self.Crouching then

        self.Crouching = false

        self:CrouchRestrictions(false)

        CrouchAnimationTrack:Stop()
        CrouchWalkCycleAnimationTrack:Stop()

    end

end


return PCmodule