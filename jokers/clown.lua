SMODS.Joker{ --Clown
    key = "clown",
    config = {
        extra = {
            dollars = 4
        }
    },
    loc_txt = {
        ['name'] = 'Clown',
        ['text'] = {
            [1] = '{C:money}+$4{} Dollars'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 18
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
    pools = { ["shit_shit_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                dollars = card.ability.extra.dollars
            }
        end
    end
}