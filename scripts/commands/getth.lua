---------------------------------------------------------------------------------------------------
-- func: getaccuracy
-- desc: prints treasure hunter level of cursor target into chatlog, for debugging.
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

    if targetType == xi.objType.PC then
        player:PrintToPlayer(string.format("%s's base Treasure Hunter w/current equipment: %i",
        target:getName(), target:getMod(xi.mod.TREASURE_HUNTER)), xi.msg.channel.SYSTEM_3)
    elseif targetType == xi.objType.PET then
        -- not needed yet, but we don't want to run MOB so just die in empty conditionals
    elseif targetType == xi.objType.TRUST then
        -- see above
    elseif targetType == xi.objType.FELLOW then
        -- see above
    elseif targetType == xi.objType.MOB then
        player:PrintToPlayer(string.format("Mob's current Treasure Hunter Tier: %i", target:getTHlevel()), xi.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Battletime: %i ", target:getBattleTime()), xi.msg.channel.SYSTEM_3)
        -- Todo: check if raged and/or how long mobs ragetimer is.
    end

end
