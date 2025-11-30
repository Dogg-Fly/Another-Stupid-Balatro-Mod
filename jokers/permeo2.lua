SMODS.Joker{ --Permeo
    key = "permeo2",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Permeo',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to copy of {C:attention}1{} random {C:attention}consumable{} card',
            [2] = 'in your possession at the end of the {C:attention}shop{}',
            [3] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 17
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 17
    },

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_shit_permeo2') 
        return {vars = {new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
    if context.ending_shop  then
        if true then
            if SMODS.pseudorandom_probability(card, 'group_0_1c96d42f', 1, card.ability.extra.odds, 'j_shit_permeo2', false) then
                    SMODS.calculate_effect({func = function()
                        local target_cards = {}
                        for i, consumable in ipairs(G.consumeables.cards) do
                            table.insert(target_cards, consumable)
                        end
                        if #target_cards > 0 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                            local card_to_copy = pseudorandom_element(target_cards, pseudoseed('copy_consumable'))
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                local copied_card = copy_card(card_to_copy)
                                copied_card:add_to_deck()
                                G.consumeables:emplace(copied_card)
                                G.GAME.consumeable_buffer = 0
                                return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Copied Consumable!", colour = G.C.GREEN})
                        end
                        return true
                        end}, card)
                    end
                end
            end
        end
}