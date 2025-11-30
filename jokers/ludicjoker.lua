SMODS.Joker{ --Ludic Joker
    key = "ludicjoker",
    config = {
        extra = {
            mult = 20
        }
    },
    loc_txt = {
        ['name'] = 'Ludic Joker',
        ['text'] = {
            [1] = '{C:mult}+20{} Mult if played hand contains a {C:orange}Flush Five{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
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

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Flush Five" then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}