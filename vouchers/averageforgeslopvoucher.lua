SMODS.Voucher {
    key = 'averageforgeslopvoucher',
    pos = { x = 2, y = 0 },
    config = { extra = {
        shop_size_value = 10
    } },
    loc_txt = {
        name = 'Average forgeslop voucher',
        text = {
        [1] = '{C:attention}+10{} Shop cards slot'
    }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
     redeem = function(self, card)
            G.E_MANAGER:add_event(Event({
            func = function()
        change_shop_size(10)
                return true
            end
        }))
    end
}