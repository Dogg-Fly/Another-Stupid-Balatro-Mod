SMODS.Joker{ --Igor
    key = "igor2",
    config = {
        extra = {
            pb_mult_34717591 = 15,
            perma_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Igor',
        ['text'] = {
            [1] = 'If the hand played is of the red suit, add {C:red}+15{} Permanent Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["shit_tyler"] = true },

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (function()
                local allMatchSuit = true
                for i, c in ipairs(context.scoring_hand) do
                    if not (c:is_suit("Hearts") or c:is_suit("Diamonds")) then
                        allMatchSuit = false
                        break
                    end
                end
                
                return allMatchSuit and #context.scoring_hand > 0
                end)() then
                    context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                    context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.pb_mult_34717591
                    return {
                        extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                    }
                end
            end
        end
}