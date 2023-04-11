-----------------------------------
-- Area: Cloister of Tremors
-- BCNM: Class Reunion
-----------------------------------
require("scripts/globals/battlefield")
-----------------------------------
local battlefieldObject = {}

battlefieldObject.onBattlefieldTick = function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end

battlefieldObject.onBattlefieldRegister = function(player, battlefield)

end

battlefieldObject.onBattlefieldEnter = function(player, battlefield)

end

battlefieldObject.onBattlefieldLeave = function(player, battlefield, leavecode)
    if leavecode == xi.battlefield.leaveCode.WON then
        local _, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 2)
    elseif leavecode == xi.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

battlefieldObject.onEventUpdate = function(player, csid, option)

end

battlefieldObject.onEventFinish = function(player, csid, option)
    if csid == 32001 and player:getCharVar("Quest[2][82]Prog") == 4 then
        player:setCharVar("Quest[2][82]Prog", 5)
    end
end

return battlefieldObject
