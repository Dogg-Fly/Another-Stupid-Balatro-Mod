SMODS.Consumable {
    key = 'sloppen2',
    set = 'spot',
    pos = { x = 0, y = 4 },
    config = { extra = {
        hand_size_value = 1
    } },
    loc_txt = {
        name = 'Sloppen',
        text = {
        [1] = 'Edit play size {C:attention}+1{}'
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
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hand Size", colour = G.C.BLUE})
                    SMODS.change_play_limit(1)
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}