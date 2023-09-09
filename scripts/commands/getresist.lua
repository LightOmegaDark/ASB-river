---------------------------------------------------------------------------------------------------
-- func: getresist
-- desc: prints resistances of cursor target into chatlog, for debugging.
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

    --[[ future use: print resistances etc..
    if extendedMode then
        -- That'll be pretty spammy.. Maybe NOT print everything and make it a choice which "page" of stats to print.
    end
    ]]
end
