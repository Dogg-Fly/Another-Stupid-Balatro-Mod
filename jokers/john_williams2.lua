SMODS.Joker{ --John Williams
    key = "john_williams2",
    config = {
        extra = {
            xchips = 3,
            odds = 1000
        }
    },
    loc_txt = {
        ['name'] = 'John Williams',
        ['text'] = {
            [1] = '{X:blue,C:white}X3{} Chips',
            [2] = '{C:green}#1# in #2#{} chance this card is',
            [3] = 'destroyed at the end of round'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 8
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_shit_john_williams2') 
        return {vars = {new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.xchips
            }
        end
    if context.end_of_round and context.game_over == false and context.main_eval  then
        if true then
            if SMODS.pseudorandom_probability(card, 'group_0_500cfe6d', 1, card.ability.extra.odds, 'j_shit_john_williams2', false) then
                    SMODS.calculate_effect({func = function()
                        card:undefined()
                        return true
                        end}, card)
                    end
                end
            end
        end
}