SMODS.Joker{ --Balatrel Balatressi
    key = "balatrel_balatressi2",
    config = {
        extra = {
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Balatrel Balatressi',
        ['text'] = {
            [1] = 'This Joker gain {X:red,C:white}X1{} Mult when win a blind',
            [2] = '{C:inactive}(Currently {X:red,C:white}X#1#{}{C:inactive}){}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 1
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
        
        return {vars = {card.ability.extra.mult}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.mult
            }
        end
    if context.end_of_round and context.game_over == false and context.main_eval  then
        return {
            func = function()
                card.ability.extra.mult = (card.ability.extra.mult) + 1
                return true
                end
            }
        end
    end
}