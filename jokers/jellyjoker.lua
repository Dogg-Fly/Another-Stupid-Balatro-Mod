SMODS.Joker{ --Jelly Joker
    key = "jellyjoker",
    config = {
        extra = {
            mult = 15
        }
    },
    loc_txt = {
        ['name'] = 'Jelly Joker',
        ['text'] = {
            [1] = '{C:mult}+15{} Mult if played hand contains a {C:orange}Flve of a Kind',
            [2] = '{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 8
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
            if context.scoring_name == "Five of a Kind" then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}