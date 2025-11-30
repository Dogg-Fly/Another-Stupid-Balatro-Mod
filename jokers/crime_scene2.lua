SMODS.Joker{ --Crime Scene
    key = "crime_scene2",
    config = {
        extra = {
            xmultvar = 0
        }
    },
    loc_txt = {
        ['name'] = 'Crime Scene',
        ['text'] = {
            [1] = 'This Joker gains {C:blue}+20{} Chips for each card {C:attention}sold{}',
            [2] = '{C:inactive}(Currently {C:blue}+#1#{} {C:inactive}Chips){}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmultvar}}
    end,

    
    calculate = function(self, card, context)
        if context.selling_card  then
            return {
                func = function()
                    card.ability.extra.xmultvar = (card.ability.extra.xmultvar) + 20
                    return true
                    end
                }
            end
            if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.xmultvar
                }
            end
        end
}