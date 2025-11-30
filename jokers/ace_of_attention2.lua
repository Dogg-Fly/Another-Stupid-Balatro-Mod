SMODS.Joker{ --Ace of Attention
    key = "ace_of_attention2",
    config = {
        extra = {
            source_rank_type = "all",
            target_rank = "A"
        }
    },
    loc_txt = {
        ['name'] = 'Ace of Attention',
        ['text'] = {
            [1] = 'All cards are considered {C:attention}Ace{} card'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
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

    if next(SMODS.find_card("j_shit_ace_of_attention2")) then
        return 14
    end
    return original_id
end
