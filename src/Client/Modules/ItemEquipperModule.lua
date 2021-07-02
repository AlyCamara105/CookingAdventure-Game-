-- Item Equipper Module
-- Username
-- July 2, 2021



local ItemEquipperModule = {}

ItemEquipperModule.RMmodule = nil

function ItemEquipperModule:Start()

    self.RMmodule = self.Modules.RadialMenuModule

end

local player = game.Players.LocalPlayer

local ReplicatedStorage = game:GetService("ReplicatedStorage")

ItemEquipperModule.ItemFolder = ReplicatedStorage.Items

function ItemEquipperModule:CheckForBasicKnife()

    if self.EquippedBasicKnife then

        self:UnequipKnife()

    elseif not self.EquippedBasicKnife then

        self:EquipKnife()

    end

end

function ItemEquipperModule:EquipKnife()

    self.Knife = self.ItemFolder.CookingKnife:Clone()

    self.Knife.PrimaryPart.Position = player.Character.PrimaryPart.Position
    self.Knife.Parent = workspace

    self.EquippedBasicKnife = true

end

function ItemEquipperModule:UnequipKnife()

    self.Knife:Destroy()

    self.EquippedBasicKnife = false

end


return ItemEquipperModule