SMODS.Joker{ --Popup
    key = "popup2",
    config = {
        extra = {
            handsremaining = 300
        }
    },
    loc_txt = {
        ['name'] = 'Popup',
        ['text'] = {
            [1] = '{C:blue}+300{} Chips for each remaining {C:attention}hand{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
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

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.handsremaining + (G.GAME.current_round.hands_left) * 0
            }
        end
    end
}