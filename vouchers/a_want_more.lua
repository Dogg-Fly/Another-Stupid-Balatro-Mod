SMODS.Voucher {
    key = 'a_want_more',
    pos = { x = 0, y = 0 },
    config = { extra = {
        Edited_booster = 1
    } },
    loc_txt = {
        name = 'A want more',
        text = {
        [1] = 'allows you to choose one more card in the booster packs'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
     redeem = function(self, card)
            G.E_MANAGER:add_event(Event({
            func = function()
        G.GAME.modifiers.booster_choice_mod = (G.GAME.modifiers.booster_choice_mod or 0) +1
                return true
            end
        }))
    end
}
