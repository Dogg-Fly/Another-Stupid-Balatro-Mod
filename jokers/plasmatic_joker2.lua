SMODS.Joker{ --Plasmatic Joker
    key = "plasmatic_joker2",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Plasmatic Joker',
        ['text'] = {
            [1] = 'Balanced {C:blue}Chips {}and {C:red}Mult{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                balance = true
            }
        end
    end
}