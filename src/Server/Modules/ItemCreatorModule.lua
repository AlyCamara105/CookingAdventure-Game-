-- Item Creator Module
-- Username
-- July 5, 2021



local ItemCreatorModule = {}


local ReplicatedStorage = game:GetService("ReplicatedStorage")

ItemCreatorModule.ItemFolder = ReplicatedStorage.Items


function ItemCreatorModule:Create(player, item)

    local ITEM = nil

    if item == "CookingKnife" then

        ITEM = self.ItemFolder.CookingKnife:Clone()
        ITEM.Parent = workspace

        if ITEM ~= nil then

            local Humanoid = player.Character.Humanoid

            Humanoid:AddAccessory(ITEM)

        end

    end    

    return ITEM

end

function ItemCreatorModule:Delete(item)

    item:Destroy()

end


return ItemCreatorModule