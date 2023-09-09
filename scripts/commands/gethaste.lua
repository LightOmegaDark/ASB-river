---------------------------------------------------------------------------------------------------
-- func: gethaste
-- desc: prints haste of cursor target into chatlog, for debugging.
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

    player:PrintToPlayer(string.format("Haste Magic: %i ", target:getMod(xi.mod.HASTE_MAGIC)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Hate Ability: %i ", target:getMod(xi.mod.HASTE_ABILITY)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Haste Gear: %i ", target:getMod(xi.mod.HASTE_GEAR)), xi.msg.channel.SYSTEM_3)

end
