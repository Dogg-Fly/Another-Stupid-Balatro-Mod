SMODS.Joker{ --Nothink
    key = "nothink2",
    config = {
        extra = {
            chips = 1
        }
    },
    loc_txt = {
        ['name'] = 'Nothink',
        ['text'] = {
            [1] = '',
            [2] = '{s:4.4}GO FUCK YOURSELF{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}