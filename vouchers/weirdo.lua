SMODS.Voucher {
    key = 'weirdo',
    pos = { x = 7, y = 0 },
    config = { extra = {
        rarity_rate = 2
    } },
    loc_txt = {
        name = 'Weirdo',
        text = {
            [1] = '{C:rare}Rare{} Jokers appear',
            [2] = '{C:attention}2X{} more frequently in the shop'
        },
        unlock = {
            [1] = ''
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_disintegration'},
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.joker_rate = G.GAME.joker_rate or 1
                G.GAME.joker_rate = G.GAME.joker_rate * 2
                return true
            end
        }))
    end
}