SMODS.Consumable {
    key = 'mimic2',
    set = 'spot',
    pos = { x = 6, y = 2 },
    config = { extra = {
        destroy_count = 1,
        add_cards_count = 2
    } },
    loc_txt = {
        name = 'Mimic',
        text = {
        [1] = 'Destroy {C:attention}1{} random card in your hand,',
        [2] = 'add {C:attention}2{} random {C:enhanced}Enhanced{} {C:attention}Jack{} to your hand'
    }
    },
    cost = 4,
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
                        local _rank = 'Jack'
                        local _suit = nil
                        local cen_pool = {}
                        for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                            if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                                cen_pool[#cen_pool + 1] = enhancement_center
                            end
                        end
                        local enhancement = pseudorandom_element(cen_pool, 'add_cards_enhancement')
                        local new_card_params = { set = "Base" }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        if enhancement then new_card_params.enhancement = enhancement.key end
                        cards[i] = SMODS.add_card(new_card_params)
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            delay(0.3)
            local destroyed_cards = {}
            local temp_hand = {}

            for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
            table.sort(temp_hand,
                function(a, b)
                    return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
                end
            )

            pseudoshuffle(temp_hand, 12345)

            for i = 1, 1 do destroyed_cards[#destroyed_cards + 1] = temp_hand[i] end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            SMODS.destroy_cards(destroyed_cards)

            delay(0.5)
    end,
    can_use = function(self, card)
        return true
    end
}