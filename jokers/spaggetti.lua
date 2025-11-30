SMODS.Joker{ --Spaggetti
    key = "spaggetti",
    config = {
        extra = {
            handsizevar = 5
        }
    },
    loc_txt = {
        ['name'] = 'Spaggetti',
        ['text'] = {
            [1] = '{C:attention}+5{} Joker slots, reduces {C:attention}1{} when a boss is defeat'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 6
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
    pools = { ["shit_food"] = true },

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if (card.ability.extra.handsizevar or 0) == 0 then
                return {
                    func = function()
                        card:undefined()
                        return true
                        end
                    }
                end
            end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
                    card.ability.extra.handsizevar = math.max(0, (card.ability.extra.handsizevar) - 1)
                    return true
                    end
                }
            end
        end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.handsizevar
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.handsizevar
    end
}