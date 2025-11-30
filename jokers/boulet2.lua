SMODS.Joker{ --Boulet
    key = "boulet2",
    config = {
        extra = {
            Xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Boulet',
        ['text'] = {
            [1] = 'Played {C:attention}Face{} card and {C:attention}Ace{} each give {X:red,C:white}X1.5{} Mult when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 2
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
    soul_pos = {
        x = 4,
        y = 2
    },

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_face() or context.other_card:get_id() == 14) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}