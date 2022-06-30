-----------------------------------
-- Energy Drain
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
require("scripts/globals/msg")
-----------------------------------
local weaponskillObject = {}

-- https://www.bg-wiki.com/ffxi/Energy_Drain
weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local fTPAnchors = { 1.25, 2.5, 4.125 }

    local startingAnchor = math.floor(tp / 1000)

    local multiplier = 0

    local damagemod = damage * ((tp - 1000) / 2000 + 1) -- Simplified formula for getting difference in tp return from 1000 tp to 3000 tp

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        damagemod = damagemod + player:getStat(xi.mod.MND)
    end

    damagemod = damagemod * xi.settings.main.WEAPON_SKILL_POWER

    local mpRestored = math.floor((math.floor(skill * 0.11) + wsc) * multiplier)

    if target:isUndead() then
        mpRestored = 0
    else
        -- Absorb MP from target
        mpRestored = target:delMP(mpRestored)

        -- Add stolen MP to player
        mpRestored = player:addMP(mpRestored)
    end

    -- Display MP actually given to player
    action:messageID(target:getID(), xi.msg.basic.SKILL_DRAIN_MP)
    action:param(target:getID(), mpRestored)

    return 1, 0, false, mpRestored
end

return weaponskillObject
