SMODS.Joker{ --That not realy balanced joker
    key = "that_not_realy_balanced_joker2",
    config = {
        extra = {
            negativo = -15,
            Xmult = 30,
            dollars = 15
        }
    },
    loc_txt = {
        ['name'] = 'That not realy balanced joker',
        ['text'] = {
            [1] = '{X:red,C:white}X30{} Mult on {C:orange}final hand{} of round',
            [2] = '{C:money}-15{} Dollars when a boss blind is defeat'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = "shit_hell",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.current_round.hands_left < 1 then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
        if context.setting_blind  then
            return {
                dollars = -card.ability.extra.dollars
            }
        end
    end
}