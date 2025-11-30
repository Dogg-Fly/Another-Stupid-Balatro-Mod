SMODS.Stake {
    name = "Kromer Stake",
    key = "kromer",
    unlocked_stake = "crypto",
    atlas = 'CustomStake',
    pos = { x = 0, y = 0 },
    applied_stakes = { "gold" },
    prefix_config = { applied_stakes = { mod = false } },
    order = 9,
    colour = HEX('FF69B4'),
    shiny = true,
    loc_txt = {
        name = 'Kromer Stake',
        text = {
            '-1 Joker slot in shop',  
        },
        sticker = {
            name = 'Kromer Sticker', 
            text = {
                'Friend inside me',
                'Friend inside me'
            }
        }
    },
    sticker_atlas = 'CustomSticker',
    sticker_pos = { x = 0, y = 0 },
    modifiers = function()
        G.GAME.shop.joker_max = math.max(1, G.GAME.shop.joker_max - 1)
    end
}

SMODS.Stake {
    name = "Crypto Stake",
    key = "crypto",
    applied_stakes = { "kromer" },
    atlas = 'CustomStake',
    pos = { x = 1, y = 0 },
    order = 10,
    colour = HEX('00FF00'),
    shiny = true,
    loc_txt = {
        name = 'Crypto Stake',
        text = {
            'Discards cost {C:money}$1{}'
        },
        sticker = {
            name = 'Crypto Sticker', 
            text = {
                 "Used this Joker",
                "to win on {C:attention}Crypto",
                "{C:attention}Stake{} difficulty",
            }
        }
    },
    sticker_atlas = 'CustomSticker',
    sticker_pos = { x = 1, y = 0 },
    modifiers = function()
        G.GAME.modifiers.discard_cost = 1
    end
}

local ref = G.FUNCS.discard_cards_from_highlighted
G.FUNCS.discard_cards_from_highlighted = function(e, hook)
    if G.GAME and G.GAME.stake and string.find(G.GAME.stake, 'crypto') then
        if G.GAME.current_round and G.GAME.current_round.discards_left > 0 then
            if G.GAME.dollars and G.GAME.dollars >= 1 then
                ease_dollars(-1)
            end
        end
    end
    
    if ref then
        return ref(e, hook)
    end
end

