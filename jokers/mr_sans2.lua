SMODS.Joker{ --Mr. Sans
    key = "mr_sans2",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Mr. Sans',
        ['text'] = {
            [1] = 'Prevents Death if Chips scored',
            [2] = 'are at least {C:attention}1%{} of required Chips',
            [3] = '{C:red}self destructs{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 10
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
    if context.end_of_round and context.game_over and context.main_eval  then
        if G.GAME.chips / G.GAME.blind.chips >= to_big(0.01) then
            return {
                saved = true,
                message = localize('k_saved_ex'),
                extra = {
                func = function()
                    card:undefined()
                    return true
                    end,
                    colour = G.C.RED
                }
            }
        end
    end
end
}