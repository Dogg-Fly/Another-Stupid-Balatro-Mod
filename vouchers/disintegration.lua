SMODS.Voucher {
    key = 'disintegration',
    pos = { x = 3, y = 0 },
    config = { extra = {
        rarity_rate = 0.5
    } },
    loc_txt = {
        name = 'Disintegration',
        text = {
            [1] = '{C:common}Common{} Jokers appear',
            [2] = '{C:attention}2X{} less frequently in the shop'
        },
        unlock = {
            [1] = ''
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
                G.GAME.joker_rate = G.GAME.joker_rate or 1
                G.GAME.joker_rate = G.GAME.joker_rate * 0.5
                return true
            end
        }))
    end
}