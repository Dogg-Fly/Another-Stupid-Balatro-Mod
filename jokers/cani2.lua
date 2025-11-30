SMODS.Joker{ --Cani
    key = "cani2",
    config = {
        extra = {
            xmultvar = 1
        }
    },
    loc_txt = {
        ['name'] = 'Cani',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X0.5{} Mult',
            [2] = 'when a card is destroyed',
            [3] = '{C:inactive}(Currently {X:red,C:white}X#1#{} {C:inactive}Mult){}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 2
    },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmultvar}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmultvar
            }
        end
        if context.remove_playing_cards  then
            return {
                func = function()
                    card.ability.extra.xmultvar = (card.ability.extra.xmultvar) + 0.5
                    return true
                    end
                }
            end
        end
}