---------------------------------------------------------------------------------------------------
-- func: getoffensive
-- desc: prints offensive stats of cursor target into chatlog, for debugging.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

-- function onTrigger(player, extendedMode)
function onTrigger(player)
    local target = player:getCursorTarget()
    if target == nil then
        player:PrintToPlayer("Target something first.")
        return
    end

    local targetType = target:getObjType()

    if targetType == xi.objType.NPC then
        player:PrintToPlayer("Target something other than an NPC..They don't have stats!")
        return
    end
    
    player:PrintToPlayer(string.format("Attack Base: %i ", target:getMod(xi.mod.ATT)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Total Attack: %i ", target:getStat(xi.mod.ATT)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Magic Attack bonus: %i ", target:getMod(xi.mod.MATT)), xi.msg.channel.SYSTEM_3)

    player:PrintToPlayer(string.format("Food Accuracy%% bonus: %i ", target:getMod(xi.mod.FOOD_ACCP)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Accuracy Base: %i ", target:getMod(xi.mod.ACC)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Total Accuracy: %i ", target:getStat(xi.mod.ACC)), xi.msg.channel.SYSTEM_3)

    player:PrintToPlayer(string.format("RAccuracy Base: %i ", target:getMod(xi.mod.RACC)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Total RAccuracy: %i ", target:getStat(xi.mod.RACC)), xi.msg.channel.SYSTEM_3)

    player:PrintToPlayer(string.format("Magic Accuracy bonus: %i ", target:getMod(xi.mod.MACC)), xi.msg.channel.SYSTEM_3)

    -- player:PrintToPlayer(string.format("Total Store TP: %i ", target:getMod(xi.mod.STORETP)), xi.msg.channel.SYSTEM_3)

end
