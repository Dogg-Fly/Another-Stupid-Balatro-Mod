SMODS.Joker{ --¿No Queen?
    key = "no_queen2",
    config = {
        extra = {
            Xmult = 4
        }
    },
    loc_txt = {
        ['name'] = '¿No Queen?',
        ['text'] = {
            [1] = '{X:red,C:white}X4{} Mult if you have no Queen held in hand'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 18
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

    
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round  then
        if not (context.other_card:get_id() == 12) then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end
end
}