SMODS.Joker{ --Orange Card
    key = "orange_card2",
    config = {
        extra = {
            multvar = 0
        }
    },
    loc_txt = {
        ['name'] = 'Orange Card',
        ['text'] = {
            [1] = 'This Joker gains {C:money}$1{} Dollar when any {C:orange}Booster Pack{} is skipped',
            [2] = '{C:inactive}(Currently{} {C:money}#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 11
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

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multvar}}
    end,

    
    calculate = function(self, card, context)
        if context.skipping_booster  then
            return {
                func = function()
                    card.ability.extra.multvar = (card.ability.extra.multvar) + 1
                    return true
                    end
                }
            end
            if context.cardarea == G.jokers and context.joker_main  then
                return {
                    dollars = card.ability.extra.multvar
                }
            end
        end
}