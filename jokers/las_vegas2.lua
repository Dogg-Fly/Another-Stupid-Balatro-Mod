SMODS.Joker{ --Las Vegas
    key = "las_vegas2",
    config = {
        extra = {
            dollars_min = 0,
            dollars_max = 100
        }
    },
    loc_txt = {
        ['name'] = 'Las Vegas',
        ['text'] = {
            [1] = 'Money set to random value between {C:money}$0{} and {C:money}$100{} Dollars after every round'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval  then
        return {
            func = function()
                local target_amount = pseudorandom('dollars_d93e84c7', card.ability.extra.dollars_min, card.ability.extra.dollars_max)
                local current_amount = G.GAME.dollars
                local difference = target_amount - current_amount
                    ease_dollars(difference)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(pseudorandom('dollars_d93e84c7', card.ability.extra.dollars_min, card.ability.extra.dollars_max)), colour = G.C.MONEY})
                        return true
                        end
                    }
                end
            end
}