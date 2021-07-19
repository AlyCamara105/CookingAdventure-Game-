-- Player Controls Module
-- Username
-- July 16, 2021



local PCmodule = {}

local RP = game:GetService("ReplicatedStorage")
local TS = game:GetService("TweenService")
local player = game.Players.LocalPlayer

local Animations = RP.Animations
local CrouchWalkCycleAnimation = Animations.CrouchWalkCycle
local CrouchAnimation = Animations.Crouch
local RunAnimation = Animations.RunCycle

local Character = nil
local Humanoid = nil
local HRP = nil
local Animator = nil
local ClientCam = nil

local CrouchWalkCycleAnimationTrack = nil
local CrouchAnimationTrack = nil
local RunAnimationTrack = nil

PCmodule.RegWalkSpeed = 16
PCmodule.RegJumpHeight = 7.2

PCmodule.Crouching = false
PCmodule.CrouchWalkSpeed = 7
PCmodule.CrouchJumpHeight = 0
PCmodule.CrouchAnimationFadeTime = 0.5

PCmodule.Running = false
PCmodule.RunWalkSpeed = 25
PCmodule.timeToReachSpeed = 0.5
PCmodule.timeforFOVTween = PCmodule.timeToReachSpeed

PCmodule.Jumping = false

local runSpeedGoal = {}
runSpeedGoal.WalkSpeed = PCmodule.RunWalkSpeed
local runTweenInfo = TweenInfo.new(PCmodule.timeToReachSpeed, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
local RunSpeedTween = nil

local regSpeedGoal = {}
regSpeedGoal.WalkSpeed = PCmodule.RegWalkSpeed
local regSpeedTweenInfo = TweenInfo.new(PCmodule.timeToReachSpeed, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
local regSpeedTween = nil

local runFOVTweenGoal = {}
runFOVTweenGoal.FieldOfView = 90
local runFOVTweenInfo = TweenInfo.new(PCmodule.timeforFOVTween, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
local runFOVTween = nil

local regFOVTweenGoal = {}
regFOVTweenGoal.FieldOfView = 70
local regFOVTweenInfo = TweenInfo.new(PCmodule.timeforFOVTween, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
local regFOVTween = nil

--Creating the animation tracks
function PCmodule:LoadAnimations()

    repeat
        wait()
    until player.Character

    Character = player.Character
    Humanoid = Character.Humanoid
    HRP = Humanoid.RootPart
    Animator = Character.Humanoid.Animator
    ClientCam = workspace.CurrentCamera

    CrouchWalkCycleAnimationTrack = Animator:LoadAnimation(CrouchWalkCycleAnimation)
    CrouchAnimationTrack = Animator:LoadAnimation(CrouchAnimation)
    RunAnimationTrack = Animator:LoadAnimation(RunAnimation)

    RunSpeedTween = TS:Create(Humanoid, runTweenInfo, runSpeedGoal)
    regSpeedTween = TS:Create(Humanoid, regSpeedTweenInfo, regSpeedGoal)

    runFOVTween = TS:Create(ClientCam, runFOVTweenInfo, runFOVTweenGoal)
    regFOVTween = TS:Create(ClientCam, regFOVTweenInfo, regFOVTweenGoal)

    Humanoid.StateChanged:Connect(function(oldState, newState) -- Controls allowing the jumping animation to play while running

        if newState == Enum.HumanoidStateType.Jumping then

            self.Jumping = true
            RunAnimationTrack:Stop()
            regFOVTween:Play()
            

            
        end

        if newState == Enum.HumanoidStateType.Landed then

            self.Jumping = false

            if self.Running then 

                regFOVTween:Play()
                self:CrouchRestrictions(false)
                self:SetRunningProperties(true)
                runFOVTween:Play()
                RunAnimationTrack:Play(self.timeToReachSpeed)

            end
        
        end
    
    end)

    Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Fix the run animation playing while client is still

        if self.Running and not self.Jumping then
    
            if Humanoid.MoveDirection.Magnitude == 0 then

                self:EndRunning()
    
            end

        end

        if self.Crouching then

            if Humanoid.MoveDirection.Magnitude > 0 then

                CrouchWalkCycleAnimationTrack:AdjustSpeed(1)

            else

                CrouchWalkCycleAnimationTrack:AdjustSpeed(0)

            end

        end
    
    end)

    player:GetPropertyChangedSignal("Character"):Connect(function()
    
        self:LoadAnimations()
    
    end)

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

        if self.Running then

            self:EndRunning()

        end

        self.Crouching = true

        regSpeedTween:Cancel()

        self:CrouchRestrictions(true)

        CrouchAnimationTrack:Play()
        
        CrouchAnimationTrack.Stopped:Connect(function()
        
            CrouchWalkCycleAnimationTrack:Play(self.CrouchAnimationFadeTime)

            local lastPosition = HRP.Position

            wait(1/math.huge)

            if HRP.Position.X == lastPosition.X or HRP.Position.Z == lastPosition.Z then

                CrouchWalkCycleAnimationTrack:AdjustSpeed(0)

            end
        
        end)  

    elseif self.Crouching then

        self.Crouching = false

        self:CrouchRestrictions(false)

        CrouchAnimationTrack:Stop()
        CrouchWalkCycleAnimationTrack:Stop(self.CrouchAnimationFadeTime)

    end

end

function PCmodule:SetRunningProperties(bool)

    if bool then

        RunSpeedTween:Play()

    else

        regSpeedTween:Play()

    end

end

function PCmodule:StartRunning()

    if not self.Running and not self.Crouching and not self.Jumping then

        local lastPosition = HRP.Position

        wait(1/math.huge)

        if HRP.Position.X ~= lastPosition.X or HRP.Position.Z ~= lastPosition.Z then

            self.Running = true

            self:SetRunningProperties(true)
            runFOVTween:Play()
            RunAnimationTrack:Play(self.timeToReachSpeed)

        end

    end

end

function PCmodule:EndRunning()

    if self.Running and not self.Crouching then

        self.Running = false

        regFOVTween:Play()
        self:SetRunningProperties(false)

        RunAnimationTrack:Stop(self.timeToReachSpeed)

    end

end

return PCmodule