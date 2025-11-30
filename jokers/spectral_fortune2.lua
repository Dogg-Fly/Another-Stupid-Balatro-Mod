SMODS.Joker{ --Spectral Fortune
    key = "spectral_fortune2",
    config = {
        extra = {
            odds = 2,
            odds2 = 4,
            dollars = 0
        }
    },
    loc_txt = {
        ['name'] = 'Spectral Fortune',
        ['text'] = {
            [1] = '{C:green}#1# in #2# chance{} to create {C:attention}2 {}{C:spectral}Spectral{} cards',
            [2] = '{C:inactive}(Must have room){}',
            [3] = '{C:green}#1# in #3# chance{} to set money to {C:attention}0{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_shit_spectral_fortune2')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_shit_spectral_fortune2')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_4cbe9ca2', 1, card.ability.extra.odds, 'j_shit_spectral_fortune2', false) then
                        SMODS.calculate_effect({func = function()
                            
                            for i = 1, math.min(undefined, G.consumeables.config.card_limit - #G.consumeables.cards) do
                                G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Spectral', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                    end
                                }))
                            end
                            delay(0.6)
                            
                            if created_consumable then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                            end
                            return true
                            end}, card)
                                SMODS.calculate_effect({func = function()
                                    
                                    for i = 1, math.min(undefined, G.consumeables.config.card_limit - #G.consumeables.cards) do
                                        G.E_MANAGER:add_event(Event({
                                        trigger = 'after',
                                        delay = 0.4,
                                        func = function()
                                            play_sound('timpani')
                                            SMODS.add_card({ set = 'Spectral', })                            
                                            card:juice_up(0.3, 0.5)
                                            return true
                                            end
                                        }))
                                    end
                                    delay(0.6)
                                    
                                    if created_consumable then
                                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                                    end
                                    return true
                                    end}, card)
                                end
                                if SMODS.pseudorandom_probability(card, 'group_1_5eb8fdf8', 1, card.ability.extra.odds2, 'j_shit_spectral_fortune2', false) then
                                        SMODS.calculate_effect({dollars = card.ability.extra.dollars}, card)
                                    end
                                end
                            end
                        end
}