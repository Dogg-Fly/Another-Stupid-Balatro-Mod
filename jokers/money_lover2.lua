SMODS.Joker{ --Money Lover
    key = "money_lover2",
    config = {
        extra = {
            pb_p_dollars_546bed6e = 5,
            perma_p_dollars = 0
        }
    },
    loc_txt = {
        ['name'] = 'Money Lover',
        ['text'] = {
            [1] = 'Every {C:attention}Face{} played permanently',
            [2] = 'gains {C:money}+5{} Dollar when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars or 0
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars + card.ability.extra.pb_p_dollars_546bed6e
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MONEY }, card = card
                }
            end
        end
    end
}