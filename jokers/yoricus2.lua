SMODS.Joker{ --Yoricus
    key = "yoricus2",
    config = {
        extra = {
            cardsdiscarded = 18,
            xmultvar = 1
        }
    },
    loc_txt = {
        ['name'] = 'Yoricus',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X0.5{} Mult every {C:orange}18{} {C:inactive}[#1#]{} cards discarded',
            [2] = '{C:inactive}(Currently {X:red,C:white}X#2#{} {C:inactive}Mult){}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 16
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 8,
        y = 16
    },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.cardsdiscarded, card.ability.extra.xmultvar}}
    end,

    
    calculate = function(self, card, context)
        if context.discard  then
            return {
                func = function()
                    card.ability.extra.cardsdiscarded = math.max(0, (card.ability.extra.cardsdiscarded) - 1)
                    return true
                    end
                }
            end
            if context.pre_discard  then
                if (card.ability.extra.cardsdiscarded or 0) == 0 then
                    return {
                        func = function()
                            card.ability.extra.cardsdiscarded = 18
                            return true
                            end,
                            extra = {
                            func = function()
                                card.ability.extra.xmultvar = (card.ability.extra.xmultvar) + 0.5
                                return true
                                end,
                                colour = G.C.GREEN
                            }
                        }
                    end
                end
                if context.cardarea == G.jokers and context.joker_main  then
                    return {
                        Xmult = card.ability.extra.xmultvar
                    }
                end
            end
}