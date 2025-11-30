SMODS.Joker{ --Freaky Joker
    key = "baseballcard2",
    config = {
        extra = {
            Xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Freaky Joker',
        ['text'] = {
            [1] = '{C:legendary}Legendary{} Jokers each give {X:red,C:white}X5{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.other_joker  then
            if (function()
                return context.other_joker.config.center.rarity == 4
                end)() then
                    return {
                        Xmult = card.ability.extra.Xmult
                    }
                end
            end
        end
}