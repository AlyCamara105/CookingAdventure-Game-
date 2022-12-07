-- Test Service
-- Username
-- May 22, 2021



local ItemCreator = {Client = {}}

local CreateItemEvent = "Create"


function ItemCreator:Start()

    local ServerItemCreatorModule = self.Modules.ItemCreatorModule

    self:ConnectClientEvent(CreateItemEvent, function(player, create, item)

        if create then

            local ITEM = ServerItemCreatorModule:Create(player, item)

            self:FireClient(CreateItemEvent, player, ITEM, item)

        elseif not create then

            ServerItemCreatorModule:Delete(item)
        
        end
        
    end)
	
end


function ItemCreator:Init()

    self:RegisterClientEvent(CreateItemEvent)
	
end


return ItemCreator