SMODS.Joker{ --St. Chroma
    key = "st_chroma2",
    config = {
        extra = {
            levels = 1
        }
    },
    loc_txt = {
        ['name'] = 'St. Chroma',
        ['text'] = {
            [1] = 'when a hand is played Level up High Card 1 level'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["shit_tyler"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local target_hand = "High Card"
            return {
                level_up = card.ability.extra.levels,
                level_up_hand = target_hand,
                message = localize('k_level_up_ex')
            }
        end
    end
}