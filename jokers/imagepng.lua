SMODS.Joker{ --Image.png
    key = "imagepng",
    config = {
        extra = {
            Xmult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Image.png',
        ['text'] = {
            [1] = 'First played {C:orange}Even{} card gives {X:red,C:white}X4{} Mult when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 7
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
                    if (scoring_card:get_id() == 2 or scoring_card:get_id() == 4 or scoring_card:get_id() == 6 or scoring_card:get_id() == 8 or scoring_card:get_id() == 10) then
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