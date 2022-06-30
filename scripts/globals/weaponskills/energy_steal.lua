-----------------------------------
-- Energy Steal
-----------------------------------
require("scripts/globals/status")
require("scripts/settings/main")
require("scripts/globals/weaponskills")
require("scripts/globals/msg")
-----------------------------------
local weaponskillObject = {}

-- https://www.bg-wiki.com/ffxi/Energy_Steal
weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local fTPAnchors = { 1.0, 2.1, 3.4 }

    local startingAnchor = math.floor(tp / 1000)

    local multiplier = 0

    local damagemod = damage * ((tp - 1000) / 2000 + 1) -- Simplified formula for getting difference in tp return from 1000 tp to 3000 tp

    if xi.settings.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        damagemod = damagemod + player:getStat(xi.mod.MND)
    end

    damagemod = damagemod * xi.settings.WEAPON_SKILL_POWER

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
