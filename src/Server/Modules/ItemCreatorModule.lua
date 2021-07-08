-- Item Creator Module
-- Username
-- July 5, 2021



local ItemCreatorModule = {}


local ReplicatedStorage = game:GetService("ReplicatedStorage")

ItemCreatorModule.ItemFolder = ReplicatedStorage.Items

function ItemCreatorModule:Create(player, item)

    local humanoid = player.Character.Humanoid

    local ITEM = nil

    if item == "CookingKnife" then

        ITEM = self.ItemFolder.CookingKnife:Clone()
        ITEM.Parent = player.Character

        if ITEM ~= nil then

            local Motor6D = Instance.new("Motor6D")
            Motor6D.Parent = player.Character.RightHand

            Motor6D.Part0 = player.Character.RightHand
            Motor6D.Part1 = player.Character.CookingKnife.PrimaryPart

            Motor6D.C0 = CFrame.new(0,-0.05,0)

        end

    elseif item == "Mortar" then

            ITEM = self.ItemFolder.Mortar:Clone()
            ITEM.Parent = player.Character
    
            if ITEM ~= nil then
    
                local Motor6D = Instance.new("Motor6D")
                Motor6D.Parent = player.Character.RightHand
    
                Motor6D.Part0 = player.Character.RightHand
                Motor6D.Part1 = player.Character.Mortar.StaffHandle
    
                Motor6D.C0 = CFrame.new(0,-0.2,0)

                local Motor6D2 = Instance.new("Motor6D")
                Motor6D2.Parent = player.Character.LeftHand
    
                Motor6D2.Part0 = player.Character.LeftHand
                Motor6D2.Part1 = player.Character.Mortar.GrinderHandle
    
                Motor6D2.C0 = CFrame.new(0,-0.15,-0.5)
    
            end

    end    

    return ITEM

end

function ItemCreatorModule:Delete(item)

    item:Destroy()

end


return ItemCreatorModule