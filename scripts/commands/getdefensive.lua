---------------------------------------------------------------------------------------------------
-- func: getaccuracy
-- desc: prints defensive stats of cursor target into chatlog, for debugging.
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
    
    player:PrintToPlayer(string.format("EVA Base: %i ", target:getMod(xi.mod.EVA)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("EVA Total: %i ", target:getStat(xi.mod.EVA)), xi.msg.channel.SYSTEM_3)

    player:PrintToPlayer(string.format("Magic EVA Base: %i ", target:getMod(xi.mod.MEVA)), xi.msg.channel.SYSTEM_3)
    -- player:PrintToPlayer(string.format("Total Magic EVA: %i ", target:getStat(xi.mod.MEVA)), xi.msg.channel.SYSTEM_3)
    -- player:PrintToPlayer("Cannot easily and accurately get Magic Evasion with current methods.")

    player:PrintToPlayer(string.format("Food Defense%% bonus: %i ", target:getMod(xi.mod.FOOD_DEFP)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Defense Base: %i ", target:getMod(xi.mod.DEF)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Total Defense: %i ", target:getStat(xi.mod.DEF)), xi.msg.channel.SYSTEM_3)

    player:PrintToPlayer(string.format("Magic Defense bonus: %i ", target:getMod(xi.mod.MDEF)), xi.msg.channel.SYSTEM_3)
    -- player:PrintToPlayer(string.format("Total Magic Defense: %i ", target:getStat(xi.mod.MDEF)), xi.msg.channel.SYSTEM_3)

    -- player:PrintToPlayer(string.format("Total Subtle Blow: %i ", target:getMod(xi.mod.SUBTLE_BLOW)), xi.msg.channel.SYSTEM_3)

end
