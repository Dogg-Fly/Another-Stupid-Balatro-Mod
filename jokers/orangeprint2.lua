SMODS.Joker{ --Orangeprint
    key = "orangeprint2",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Orangeprint',
        ['text'] = {
            [1] = 'Copies ability of {C:attention}Joker{} Slot 5'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        
        local target_joker = nil
        
        target_joker = G.jokers.cards[5]
        if target_joker == card then
            target_joker = nil
        end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
                SMODS.calculate_effect(ret, card)
            end
        end
}