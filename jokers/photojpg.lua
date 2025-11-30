SMODS.Joker{ --Photo.jpg
    key = "photojpg",
    config = {
        extra = {
            Xmult = 3
        }
    },
    loc_txt = {
        ['name'] = 'Photo.jpg',
        ['text'] = {
            [1] = 'First played {C:orange}Odd{} card gives {X:red,C:white}X3{} Mult when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (function()
                for i = 1, #context.scoring_hand do
                    local scoring_card = context.scoring_hand[i]
                    if (scoring_card:get_id() == 14 or scoring_card:get_id() == 3 or scoring_card:get_id() == 5 or scoring_card:get_id() == 7 or scoring_card:get_id() == 9) then
                        return scoring_card == context.other_card
                        end
                    end
                    return false
                    end)() then
                        return {
                            Xmult = card.ability.extra.Xmult
                        }
                    end
                end
            end
}