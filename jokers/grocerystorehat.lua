SMODS.Joker{ --Grocery Store Hat
    key = "grocerystorehat",
    config = {
        extra = {
            multvar = 0
        }
    },
    loc_txt = {
        ['name'] = 'Grocery Store Hat',
        ['text'] = {
            [1] = 'This Joker gains {C:mult}+15{} Mult if played hand contains a {C:orange}Five of a Kind{}',
            [2] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 18
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multvar}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.multvar
            }
        end
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if next(context.poker_hands["Five of a Kind"]) then
                return {
                    func = function()
                        card.ability.extra.multvar = (card.ability.extra.multvar) + 15
                        return true
                        end
                    }
                end
            end
        end
}