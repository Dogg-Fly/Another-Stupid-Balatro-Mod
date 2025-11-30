SMODS.Joker{ --Silla Naranja
    key = "silla_naranja2",
    config = {
        extra = {
            discards = 2,
            round = 0
        }
    },
    loc_txt = {
        ['name'] = 'Silla Naranja',
        ['text'] = {
            [1] = 'when a blind is selected it destroys a consumable and adds +2 discards'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 13
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if #G.consumeables.cards >= 1 then
                return {
                    func = function()
                        local target_cards = {}
                        for i, consumable in ipairs(G.consumeables.cards) do
                            table.insert(target_cards, consumable)
                        end
                        if #target_cards > 0 then
                            local card_to_destroy = pseudorandom_element(target_cards, pseudoseed('destroy_consumable'))
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                card_to_destroy:start_dissolve()
                                return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed Consumable!", colour = G.C.RED})
                        end
                        return true
                        end,
                        extra = {
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.discards).." Discard", colour = G.C.ORANGE})
                            G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + card.ability.extra.discards
                            return true
                            end,
                            colour = G.C.ORANGE
                        }
                    }
                end
            end
        end
}