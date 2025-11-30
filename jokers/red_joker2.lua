SMODS.Joker{ --Red Joker
    key = "red_joker2",
    config = {
        extra = {
            cardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Red Joker',
        ['text'] = {
            [1] = '{C:red}+4{} Mult for each remaining card in {C:attention}deck{}',
            [2] = '{C:inactive}(Currently {C:red}+#1#{} {C:inactive}Mult){}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 12
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
        
        return {vars = {((#(G.deck and G.deck.cards or {}) or 0)) * 4}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = (#(G.deck and G.deck.cards or {})) * 4
            }
        end
    end
}