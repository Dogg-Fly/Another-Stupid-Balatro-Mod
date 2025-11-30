SMODS.Joker{ --Lulo Joker
    key = "lulo_joker2",
    config = {
        extra = {
            spectralcardsused = 0
        }
    },
    loc_txt = {
        ['name'] = 'Lulo Joker',
        ['text'] = {
            [1] = '{C:red}+50{} Mult per {C:spectral}Spectral{} card used this run',
            [2] = '{C:inactive}(Currently {C:red}+#1#{} {C:inactive}Mult){}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {(((G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0) or 0)) * 50}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = ((G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0)) * 50
            }
        end
    end
}