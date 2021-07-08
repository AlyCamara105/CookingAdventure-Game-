-- Item Equipper Module
-- Username
-- July 2, 2021



local ItemEquipperModule = {}

ItemEquipperModule.RMmodule = nil

function ItemEquipperModule:Start()

    self.RMmodule = self.Modules.GuiController

    self.Services.ItemCreator.Create:Connect(function(ITEM)

        if ITEM == nil then

            print("The server was not able to create the item! (Client)")

        else

            print("The server created the item! (Client)")
            self.EquippedBasicKnife = true
            self.Knife = ITEM
    
        end
    
    end)

end

function ItemEquipperModule:CheckForBasicKnife()

    if self.EquippedBasicKnife then

        self:UnequipKnife()

    elseif not self.EquippedBasicKnife then

        self:EquipKnife()

    end

end

function ItemEquipperModule:EquipKnife()

    self.Services.ItemCreator.Create:Fire(true, "CookingKnife")

end

function ItemEquipperModule:UnequipKnife()

    self.Services.ItemCreator.Create:Fire(false, self.Knife)

    self.EquippedBasicKnife = false

end


return ItemEquipperModule