SMODS.Joker{ --Assistant
    key = "assistant2",
    config = {
        extra = {
            mult = 66
        }
    },
    loc_txt = {
        ['name'] = 'Assistant',
        ['text'] = {
            [1] = 'When a {C:attention}Ace{} is held in hand give {C:red}+66{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round  then
        if context.other_card:get_id() == 14 then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
end
}