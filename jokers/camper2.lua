SMODS.Joker{ --Camper
    key = "camper2",
    config = {
        extra = {
            pb_bonus_546bed6e = 50,
            perma_bonus = 0
        }
    },
    loc_txt = {
        ['name'] = 'Camper',
        ['text'] = {
            [1] = 'Every{C:attention} Ace {}played permanently',
            [2] = 'gains {C:blue}+50{} Chips when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 2
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
            if context.other_card:get_id() == 14 then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.pb_bonus_546bed6e
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
            end
        end
    end
}