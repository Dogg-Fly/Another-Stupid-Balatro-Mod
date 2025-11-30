SMODS.Voucher {
    key = 'givemeahand',
    pos = { x = 5, y = 0 },
    config = { extra = {
        currentmoney = 0
    } },
    loc_txt = {
        name = 'Give me a hand',
        text = {
        [1] = 'Get hands for the amount of money you have',
        [2] = '{C:inactive}(Currently{} {C:common}#1#{}{C:inactive}){}'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
    loc_vars = function(self, info_queue, card)
        return {vars = {(G.GAME.dollars or 0)}}
    end,
     redeem = function(self, card)
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + G.GAME.dollars
        ease_hands_played(G.GAME.dollars)
    end
}