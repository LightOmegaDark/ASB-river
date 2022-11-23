local ID = require('scripts/zones/Bastok_Markets/IDs')
require('scripts/globals/events/starlight_celebrations')

return {
    ['Alert_Gaze']  = { event = 131 },
    ['Angry_Bull']  = { event = 472 },
    ['Anguysh'] =
    {
        onTrigger = function(player, npc)
            if xi.events.starlightCelebration.isStarlightEnabled() ~= 0 then
                xi.events.starlightCelebration.merryMakersNPCDeliverOnTrigger(player, npc, 135)
            else
                player:startEvent(135)
            end
        end,
    },
    ['Aquillina']   = { event = 116 },
    ['Arawn']       = { event = 114 },
    ['Ardea']       = { event = 260 },
    ['Big_Harvest'] = { event = 134 },
    ['Biggorf']     = { event = 126 },
    ['Brygid']      = { event = 119 },
    ['Degenhard']   = { event = 255 },
    ['Domhnall']    = { event = 117 },
    ['Emrys']       = { event = 115 },
    ['Enu']         = { event = 327 },
    ['Epione'] =
    {
        onTrigger = function(player, npc)
            if xi.events.starlightCelebration.isStarlightEnabled() ~= 0 then
                xi.events.starlightCelebration.merryMakersNPCDeliverOnTrigger(player, npc, 130)
            else
                player:startEvent(130)
            end
        end,
    },
    ['Foss']        = { event = 270 },
    ['Gwill']       = { event = 113 },
    ['Hildith']     = { event = 488 },
    ['Horatius']    = { event = 110 },
    ['Julio']       = { event = 275 },
    ['Ken']         = { event = 361 },
    ['Lame_Deer'] =
    {
        onTrigger = function(player, npc)
            if xi.events.starlightCelebration.isStarlightEnabled() ~= 0 then
                xi.events.starlightCelebration.merryMakersNPCDeliverOnTrigger(player, npc, 129)
            else
                player:startEvent(129)
            end
        end,
    },
    ['Lavinia']     = { event = 123 },
    ['Loulia']      = { event = 487 },
    ['Marin']       = { event = 361 },
    ['Matthias']    = { event = 499 },
    ['Michea']      = { event = 125 },
    ['Nbu_Latteh']  = { event = 127 },
    ['Nudara']      = { event = 118 },
    ['Offa']        = { event = 124 },
    ['Parnika']     = { event = 136 },
    ['Pavel'] =
    {
        onTrigger = function(player, npc)
            if xi.events.starlightCelebration.isStarlightEnabled() ~= 0 then
                xi.events.starlightCelebration.merryMakersNPCDeliverOnTrigger(player, npc, 128)
            else
                player:startEvent(128)
            end
        end,
    },
    ['Red_Canyon'] =
    {
        onTrigger = function(player, npc)
            if xi.events.starlightCelebration.isStarlightEnabled() ~= 0 then
                xi.events.starlightCelebration.merryMakersNPCDeliverOnTrigger(player, npc, 133)
            else
                player:startEvent(133)
            end
        end,
    },
    ['Rock_Jaw']    = { event = 325 },
    ['Samia']       = { event = 111 },
    ['Shamarhaan']  = { event = 433 },
    ['Tancredi'] =
    {
        onTrigger = function(player, npc)
            if xi.events.starlightCelebration.isStarlightEnabled() ~= 0 then
                xi.events.starlightCelebration.merryMakersNPCDeliverOnTrigger(player, npc, 132)
            else
                player:startEvent(132)
            end
        end,
    },
    ['Tanguy']      = { event = 120 },
    ['Umberto']     = { event = 411 },
    ['Zacc']        = { event = 328 },
    ['Zon-Fobun']   = { event = 250 },
}
