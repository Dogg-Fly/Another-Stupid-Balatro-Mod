SMODS.Joker{ --Colector
    key = "colector2",
    config = {
        extra = {
            chips = 55
        }
    },
    loc_txt = {
        ['name'] = 'Colector',
        ['text'] = {
            [1] = '{C:blue}+55{} Chips per consumable'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 3
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

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}