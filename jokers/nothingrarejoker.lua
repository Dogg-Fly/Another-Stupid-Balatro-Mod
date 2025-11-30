SMODS.Joker{ --Nothing Rare Joker
    key = "nothingrarejoker",
    config = {
        extra = {
            chips = 67
        }
    },
    loc_txt = {
        ['name'] = 'Nothing Rare Joker',
        ['text'] = {
            [1] = '{C:blue}+67{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 18
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
    pools = { ["shit_shit_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}