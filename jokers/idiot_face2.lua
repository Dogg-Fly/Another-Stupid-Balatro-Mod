SMODS.Joker{ --Idiot Face
    key = "idiot_face2",
    config = {
        extra = {
            mult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Idiot Face',
        ['text'] = {
            [1] = 'Played {C:orange}Ace{} give {C:mult}+5{} Mult when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 7
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
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 14 then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}