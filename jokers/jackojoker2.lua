SMODS.Joker{ --Jack-o-Joker
    key = "jackojoker2",
    config = {
        extra = {
            chips = 11
        }
    },
    loc_txt = {
        ['name'] = 'Jack-o-Joker',
        ['text'] = {
            [1] = 'Each {C:orange}Jack{} held in hand gives {C:blue}+11{} Chips'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round  then
        if context.other_card:get_id() == 11 then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
end
}