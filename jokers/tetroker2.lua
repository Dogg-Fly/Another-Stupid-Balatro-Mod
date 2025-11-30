SMODS.Joker{ --Tetroker
    key = "tetroker2",
    config = {
        extra = {
            jokercount = 0
        }
    },
    loc_txt = {
        ['name'] = 'Tetroker',
        ['text'] = {
            [1] = '{X:red,C:white}X1{} Mult for each {C:attention}Joker{}.',
            [2] = 'Tetroker included',
            [3] = '{C:inactive}(Currently {X:red,C:white}X#1#{}{C:inactive} {C:inactive}Mult){}{}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {#(G.jokers and (G.jokers and G.jokers.cards or {}) or {})}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = #(G.jokers and G.jokers.cards or {})
            }
        end
    end
}