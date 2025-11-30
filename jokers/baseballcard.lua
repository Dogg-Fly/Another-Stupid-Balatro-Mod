SMODS.Joker{ --Weird Joker
    key = "baseballcard",
    config = {
        extra = {
            Xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Weird Joker',
        ['text'] = {
            [1] = '{C:rare}Rare{} Jokers each give {X:red,C:white}X2{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
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
                return context.other_joker.config.center.rarity == 3
                end)() then
                    return {
                        Xmult = card.ability.extra.Xmult
                    }
                end
            end
        end
}