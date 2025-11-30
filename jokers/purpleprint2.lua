SMODS.Joker{ --Purpleprint
    key = "purpleprint2",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Purpleprint',
        ['text'] = {
            [1] = 'Copies ability of {C:attention}Joker{} Slot 3'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        
        local target_joker = nil
        
        target_joker = G.jokers.cards[3]
        if target_joker == card then
            target_joker = nil
        end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
                SMODS.calculate_effect(ret, card)
            end
        end
}