SMODS.Joker{ --Cookie Joker
    key = "cookiejoker",
    config = {
        extra = {
            Xmult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Cookie Joker',
        ['text'] = {
            [1] = '{X:red,C:white}X4{} Mult but {C:attention}-2 {}Joker Slot'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
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

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - 2)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 2
    end
}