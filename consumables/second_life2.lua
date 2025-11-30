SMODS.Consumable {
    key = 'second_life2',
    set = 'ultrarot',
    pos = { x = 8, y = 3 },
    config = { extra = {
        add_cards_count = 2
    } },
    loc_txt = {
        name = 'Second Life',
        text = {
        [1] = 'Create {C:attention}2{} cards'
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
                delay = 0.7,
                func = function()
                    local cards = {}
                    for i = 1, 2 do
                        local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
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