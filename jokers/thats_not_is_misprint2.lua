SMODS.Joker{ --Thats not is Misprint
    key = "thats_not_is_misprint2",
    config = {
        extra = {
            odds = 4,
            odds2 = 4,
            odds3 = 4,
            odds4 = 4,
            respect = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Thats not is Misprint',
        ['text'] = {
            [1] = '{C:green}#3# in #4#{} chance to create a spectral card when played hand is straight flush',
            [2] = '{C:green}#3# in #4#{} chance to create a {C:attention}1{} {C:common}Common{} Joker',
            [3] = '{C:inactive}(must have room){}',
            [4] = '{C:green}#3# in #4#{} chance to disable boss blind when this card is sold',
            [5] = '{C:green}#3# in #4#{} chance to convert all played card in gold'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_shit_thats_not_is_misprint2') 
        return {vars = {card.ability.extra.n, card.ability.extra.respect, new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_dcbe14c7', 1, card.ability.extra.odds, 'j_shit_thats_not_is_misprint2', false) then
                    context.other_card:set_ability(G.P_CENTERS.m_gold)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
                    end
                end
            end
            if context.cardarea == G.jokers and context.joker_main  then
                if next(context.poker_hands["Straight Flush"]) then
                    if SMODS.pseudorandom_probability(card, 'group_0_848feeef', 1, card.ability.extra.odds, 'j_shit_thats_not_is_misprint2', false) then
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
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
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_consumable and localize('k_plus_spectral') or nil, colour = G.C.SECONDARY_SET.Spectral})
                    end
                elseif true then
                    if SMODS.pseudorandom_probability(card, 'group_0_9ab70ae4', 1, card.ability.extra.odds, 'j_shit_thats_not_is_misprint2', false) then
                        local created_joker = false
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            created_joker = true
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Common' })
                                if joker_card then
                                    
                                    
                                end
                                G.GAME.joker_buffer = 0
                                return true
                                end
                            }))
                        end
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                    end
                end
            end
            if context.selling_card  then
                if true then
                    if SMODS.pseudorandom_probability(card, 'group_0_cc4efcf8', 1, card.ability.extra.odds, 'j_shit_thats_not_is_misprint2', false) then
                            SMODS.calculate_effect({func = function()
                                if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                                    G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.GAME.blind:disable()
                                        play_sound('timpani')
                                        return true
                                        end
                                    }))
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
                                end
                                return true
                                end}, card)
                            end
                        end
                    end
                end
}