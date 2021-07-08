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

        if ITEM ~= nil and humanoid.Health ~= 0 then

            local Motor6D = Instance.new("Motor6D")
            Motor6D.Parent = player.Character.RightHand

            Motor6D.Part0 = player.Character.RightHand
            Motor6D.Part1 = player.Character.CookingKnife.PrimaryPart

            Motor6D.C0 = CFrame.new(0,-0.05,0)

            --(This was when I made the items Accessories)This solves the problem. Next problem is making it a group so that I could get it to animate through studio.
            --Motor6D.C0 = ITEM.Handle.CFrame:Inverse() * desiredCFrame

        end

    end    

    return ITEM

end

function ItemCreatorModule:Delete(item)

    item:Destroy()

end


return ItemCreatorModule