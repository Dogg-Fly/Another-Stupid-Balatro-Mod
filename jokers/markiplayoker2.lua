SMODS.Joker{ --Markiplayoker
    key = "markiplayoker2",
    config = {
        extra = {
            chips = 8,
            mult = 7
        }
    },
    loc_txt = {
        ['name'] = 'Markiplayoker',
        ['text'] = {
            [1] = 'Each played {C:attention}8{} or {C:attention}7{} gives',
            [2] = '{C:blue}+8{} Chips and {C:red}+7{} Mult when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = "shit_shitpost",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 8 or context.other_card:get_id() == 7) then
                return {
                    chips = card.ability.extra.chips,
                    extra = {
                    mult = card.ability.extra.mult
                }
            }
        end
    end
end
}