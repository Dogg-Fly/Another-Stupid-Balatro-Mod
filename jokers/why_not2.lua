SMODS.Joker{ --Why not?
    key = "why_not2",
    config = {
        extra = {
            source_rank_type = "all",
            target_rank = "3"
        }
    },
    loc_txt = {
        ['name'] = 'Why not?',
        ['text'] = {
            [1] = 'all cards are considered {C:attention}3{} card'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 16
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
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
        -- Combine ranks effect enabled
    end,

    remove_from_deck = function(self, card, from_debuff)
        -- Combine ranks effect disabled
    end
}


local card_get_id_ref = Card.get_id
function Card:get_id()
    local original_id = card_get_id_ref(self)
    if not original_id then return original_id end

    if next(SMODS.find_card("j_shit_why_not2")) then
        return 14
    end
    return original_id
end
