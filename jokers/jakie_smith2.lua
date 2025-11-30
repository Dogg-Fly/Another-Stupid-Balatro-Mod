SMODS.Joker{ --Jakie Smith
    key = "jakie_smith2",
    config = {
        extra = {
            chips = 20,
            odds = 6
        }
    },
    loc_txt = {
        ['name'] = 'Jakie Smith',
        ['text'] = {
            [1] = '{C:chips}+20{} Chips',
            [2] = '{C:green}#1# in #2#{} chance this is destroyed at the end of round.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_shit_jakie_smith2') 
        return {vars = {new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips
            }
        end
    if context.end_of_round and context.game_over == false and context.main_eval  then
        if true then
            if SMODS.pseudorandom_probability(card, 'group_0_d0a47bc3', 1, card.ability.extra.odds, 'j_shit_jakie_smith2', false) then
                    SMODS.calculate_effect({func = function()
                        card:undefined()
                        return true
                        end}, card)
                    end
                end
            end
        end
}