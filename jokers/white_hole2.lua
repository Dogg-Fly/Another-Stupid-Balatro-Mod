SMODS.Joker{ --White Hole
    key = "white_hole2",
    config = {
        extra = {
            cardsindiscard = 0
        }
    },
    loc_txt = {
        ['name'] = 'White Hole',
        ['text'] = {
            [1] = 'Adds the number of times {C:attention}card{} has',
            [2] = 'been discarted this run to Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 16
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
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = #(G.discard and G.discard.cards or {})
            }
        end
    end
}