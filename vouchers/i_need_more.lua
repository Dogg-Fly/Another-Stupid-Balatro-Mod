SMODS.Voucher {
    key = 'i_need_more',
    pos = { x = 6, y = 0 },
    config = { extra = {
        Edited_booster = 2
    } },
    loc_txt = {
        name = 'I need more',
        text = {
        [1] = 'allows you to choose 2 more cards from the booster packs'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_a_want_more'},
    atlas = 'CustomVouchers',
     redeem = function(self, card)
            G.E_MANAGER:add_event(Event({
            func = function()
        G.GAME.modifiers.booster_choice_mod = (G.GAME.modifiers.booster_choice_mod or 0) +2
                return true
            end
        }))
    end
}