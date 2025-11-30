SMODS.Voucher {
    key = 'allin',
    pos = { x = 1, y = 0 },
    config = { extra = {
        hand_size_value = 15,
        discards_value = 0,
        joker_slots_value = 1
    } },
    loc_txt = {
        name = 'All In',
        text = {
        [1] = '{C:attention}+1{} Joker Slot',
        [2] = '{C:attention}+15 {}Hand Size',
        [3] = '{C:red}No Discards{}'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
     redeem = function(self, card)
            G.GAME.round_resets.discards = 0
        ease_discard(0 - G.GAME.current_round.discards_left)
            G.hand:change_size(15)
        
            
        G.E_MANAGER:add_event(Event({
            func = function()
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                return true
            end
        }))
    end
}