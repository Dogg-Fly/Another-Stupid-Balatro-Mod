SMODS.Joker{ --Comic Joker
    key = "comicjoker",
    config = {
        extra = {
            chips = 105
        }
    },
    loc_txt = {
        ['name'] = 'Comic Joker',
        ['text'] = {
            [1] = '{C:chips}+105{} Chips if played hand contains a {C:orange}Flush Five{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
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
            if context.scoring_name == "Flush Five" then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}