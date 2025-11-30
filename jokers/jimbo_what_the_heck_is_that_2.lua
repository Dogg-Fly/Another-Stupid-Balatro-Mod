SMODS.Joker{ --JIMBO WHAT THE HECK IS THAT 
    key = "jimbo_what_the_heck_is_that_2",
    config = {
        extra = {
            mod_probability = 100000000000000000000,
            numerator = 0
        }
    },
    loc_txt = {
        ['name'] = 'JIMBO WHAT THE HECK IS THAT ',
        ['text'] = {
            [1] = 'ALL PROBABILITIES'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = "shit_shitpost",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.mod_probability  then
            local numerator, denominator = context.numerator, context.denominator
            numerator = numerator * (card.ability.extra.mod_probability)
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
    end
}