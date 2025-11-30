SMODS.Voucher {
    key = 'dont_touch_me',
    pos = { x = 4, y = 0 },
    config = { extra = {
        currentmoney = 0
    } },
    loc_txt = {
        name = 'Dont Touch Me',
        text = {
        [1] = 'Get discards for the amount of money you have',
        [2] = '{C:inactive}(Currently{} {C:red}#1#{}{C:inactive}){}'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_shit_givemeahand'},
    atlas = 'CustomVouchers',
    loc_vars = function(self, info_queue, card)
        return {vars = {(G.GAME.dollars or 0)}}
    end,
     redeem = function(self, card)
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + G.GAME.dollars
        ease_discard(G.GAME.dollars)
    end
}