SMODS.Joker{ --Webjoker Torso
    key = "webjokertorso",
    config = {
        extra = {
            chips = 10,
            Xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Webjoker Torso',
        ['text'] = {
            [1] = '{C:blue}+10{} Chips {X:red,C:white}X1.5{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 16
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
                chips = card.ability.extra.chips,
                extra = {
                Xmult = card.ability.extra.Xmult
            }
        }
    end
end
}