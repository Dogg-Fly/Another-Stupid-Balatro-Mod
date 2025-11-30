SMODS.Joker{ --Kookoo
    key = "kookoo2",
    config = {
        extra = {
            odds = 3,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Kookoo',
        ['text'] = {
            [1] = '{C:green}#1# in #2# chance{} to create a {C:tarot}Ultrarot{} card when any {C:attention}Booster Pack{} is opened'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 8
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

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_shit_kookoo2') 
        return {vars = {card.ability.extra.n, new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.open_booster  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_38ddc98d', 1, card.ability.extra.odds, 'j_shit_kookoo2', false) then
                        SMODS.calculate_effect({func = function()
                            
                            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                                G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'ultrarot', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                    end
                                }))
                            end
                            delay(0.6)
                            
                            if created_consumable then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                            end
                            return true
                            end}, card)
                        end
                    end
                end
            end
}