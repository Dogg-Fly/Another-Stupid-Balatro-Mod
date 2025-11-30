SMODS.Joker{ --lb0_spr_Guy10
    key = "lb0sprguy11",
    config = {
        extra = {
            Xmult = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'lb0_spr_Guy10',
        ['text'] = {
            [1] = '{X:red,C:white}X0.10{} Mult if a {C:attention}10{} is played'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
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
                local rankFound = false
                for i, c in ipairs(context.scoring_hand) do
                    if c:get_id() == 10 then
                        rankFound = true
                        break
                    end
                end
                
                return rankFound
                end)() then
                    return {
                        Xmult = card.ability.extra.Xmult
                    }
                end
            end
        end
}