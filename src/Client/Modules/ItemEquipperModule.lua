-- Item Equipper Module
-- Username
-- July 2, 2021



local ItemEquipperModule = {}

ItemEquipperModule.RMmodule = nil

ItemEquipperModule.EquippedItem = nil

function ItemEquipperModule:CheckEquippedItem(item)

    if self.EquippedItem ~= nil and self.EquippedItem ~= item then

        local Item = self.EquippedItem

        if Item == "CookingKnife" then

            self:UnequipKnife()

        elseif Item == "Mortar" then

            self:UnequipMortar()

        end

    end

end

function ItemEquipperModule:Start()

    -- The Gui Controller module
    self.RMmodule = self.Modules.GuiController

    -- function connected to the event fired from server after item has or has not been created
    self.Services.ItemCreator.Create:Connect(function(ITEM, item)

        if ITEM == nil then

            print("The server was not able to create the item! (Client)")

        else

            print("The server created the item! (Client)")

            if item == "CookingKnife" then

                self.EquippedBasicKnife = true
                self.CookingKnife = ITEM

                self.EquippedItem = item

            elseif item == "Mortar" then

                self.EquippedMortar = true
                self.Mortar = ITEM

                self.EquippedItem = item

            end
    
        end
    
    end)

end

function ItemEquipperModule:CheckForBasicKnife()

    self:CheckEquippedItem("CookingKnife")

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

    self.Services.ItemCreator.Create:Fire(false, self.CookingKnife)

    self.EquippedBasicKnife = false

end

function ItemEquipperModule:CheckForMortar()

    self:CheckEquippedItem("Mortar")

    if self.EquippedMortar then

        self:UnequipMortar()

    elseif not self.EquippedMortar then

        self:EquipMortar()

    end

end

function ItemEquipperModule:EquipMortar()

    self.Services.ItemCreator.Create:Fire(true, "Mortar")

end

function ItemEquipperModule:UnequipMortar()

    self.Services.ItemCreator.Create:Fire(false, self.Mortar)

    self.EquippedMortar = false

end


return ItemEquipperModule