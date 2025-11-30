SMODS.Joker{ --Three Fingers
    key = "three_fingers2",
    config = {
        extra = {
            reduction_value = 2
        }
    },
    loc_txt = {
        ['name'] = 'Three Fingers',
        ['text'] = {
            [1] = 'All {C:attention}Flushes{} and {C:attention}Straights{} can be made with 3 cards'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 15
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
    end,

    add_to_deck = function(self, card, from_debuff)
        -- Flush/Straight requirements reduced by 2
    end,

    remove_from_deck = function(self, card, from_debuff)
        -- Flush/Straight requirements restored
    end
}


local smods_four_fingers_ref = SMODS.four_fingers
function SMODS.four_fingers()
    if next(SMODS.find_card("j_shit_three_fingers2")) then
        return 3
    end
    return smods_four_fingers_ref()
end