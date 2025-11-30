SMODS.Consumable {
    key = 'threshold2',
    set = 'ultrarot',
    pos = { x = 9, y = 4 },
    config = { extra = {
        discards_value = 1
    } },
    loc_txt = {
        name = 'Threshold',
        text = {
        [1] = '1 {}more {C:red}discard{} for this round'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Discard", colour = G.C.ORANGE})
                    
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
        ease_discard(1)
        
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}