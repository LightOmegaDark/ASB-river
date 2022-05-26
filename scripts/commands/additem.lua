-----------------------------------
-- func: additem <itemId> <quantity> <aug1> <v1> <aug2> <v2> <aug3> <v3> <aug4> <v4> <trial>
-- desc: Adds an item to the GMs inventory.
-----------------------------------

cmdprops =
{
    permission = 1,
    parameters = "siiiiiiiiii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!additem <item> {quantity} {aug1} {v1} {aug2} {v2} {aug3} {v3} {aug4} {v4} {trial}")
end

function onTrigger(player, item, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val, trialId)
    -- Load needed text ids for players current zone..
    local ID = zones[player:getZoneID()]
    local itemToGet = 0

    if type(itemId) == "string" then
        if (name == nil or tostring(name) == nil) then
            error(player, "Invalid name.")
            return
        end
        
        local itemId = GetItemIDByName(name)
    end

    -- validate itemId
    if (itemId == nil or tonumber(itemId) == nil or tonumber(itemId) == 0) then
        error(player, "Invalid itemId.")
        return
    end

    -- TODO: check qty and stack size + remaining inventory space instead of hardcoded == 0 check
    -- Ensure the GM has room to obtain the item...
    if player:getFreeSlotsCount() == 0 then
        if quantity > 1 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED + 1, itemToGet)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, itemToGet)
        end

        return
    end

    -- Give the GM the item...
    local obtained = player:addItem(itemToGet, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val, trialId)
    if obtained then
        if quantity and quantity > 1 then
            player:messageSpecial(ID.text.ITEM_OBTAINED + 9, itemToGet, quantity)
        else
            player:messageSpecial(ID.text.ITEM_OBTAINED, itemToGet)
        end
    end
end