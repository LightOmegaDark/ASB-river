---------------------------------------------------------------------------------------------------
-- func: getstats
-- desc: prints stats of cursor target into chatlog, for debugging.
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

    player:PrintToPlayer(string.format("MainJob(jID: %s) LV: %i / SubJob(jID: %s) LV: %i ",
        target:getMainJob(), target:getMainLvl(), target:getSubJob(), target:getSubLvl()), xi.msg.channel.SYSTEM_3)

    player:PrintToPlayer(string.format("HP: %i/%i  MP: %i/%i (current/max) ",
        target:getHP(), target:getMaxHP(), target:getMP(), target:getMaxMP()), xi.msg.channel.SYSTEM_3)

    player:PrintToPlayer(string.format("Total STR: %i ", target:getStat(xi.mod.STR)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Total DEX: %i ", target:getStat(xi.mod.DEX)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Total VIT: %i ", target:getStat(xi.mod.VIT)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Total AGI: %i ", target:getStat(xi.mod.AGI)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Total MND: %i ", target:getStat(xi.mod.MND)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Total INT: %i ", target:getStat(xi.mod.INT)), xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Total CHR: %i ", target:getStat(xi.mod.CHR)), xi.msg.channel.SYSTEM_3)

end
