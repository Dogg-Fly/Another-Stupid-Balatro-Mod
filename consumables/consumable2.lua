SMODS.Consumable {
    key = 'consumable2',
    set = 'Spectral',
    pos = { x = 3, y = 5 },
    config = { extra = {
        add_cards_count = 67
    } },
    loc_txt = {
        name = '67',
        text = {
        [1] = '67'
    }
    },
    cost = 67,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    local cards = {}
                    for i = 1, 67 do
                        local _rank = '6'
                        local _suit = nil
                        local new_card_params = { set = "Base" }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        cards[i] = SMODS.add_card(new_card_params)
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            delay(0.3)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    local cards = {}
                    for i = 1, 67 do
                        local _rank = '7'
                        local _suit = nil
                        local new_card_params = { set = "Base" }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        cards[i] = SMODS.add_card(new_card_params)
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            delay(0.3)
    end,
    can_use = function(self, card)
        return true
    end
}