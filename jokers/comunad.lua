SMODS.Joker{ --Comunad
    key = "comunad",
    config = {
        extra = {
            Xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Comunad',
        ['text'] = {
            [1] = '{X:red,C:white}X2{} Mult if played card have Rainbow Mult Enchantment'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_shit_rainbow_mult2"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_shit_rainbow_mult2\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_shit_rainbow_mult2"] == true then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}