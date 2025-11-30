SMODS.Joker{ --Yoshit
    key = "yoshit2",
    config = {
        extra = {
            cardsdiscarded = 50,
            xmultvar = 1
        }
    },
    loc_txt = {
        ['name'] = 'Yoshit',
        ['text'] = {
            [1] = 'This Joker gains {C:red}0.5{} Mult every {C:orange}50{} {C:inactive}[#1#]{} cards discarded',
            [2] = '{C:inactive}(Currently {C:red}#2#{} {C:inactive}Mult){}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 17
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "shit_shitpost",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 6,
        y = 17
    },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.cardsdiscarded, card.ability.extra.xmultvar}}
    end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
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
                            card.ability.extra.cardsdiscarded = 50
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
                        mult = card.ability.extra.xmultvar
                    }
                end
            end
}