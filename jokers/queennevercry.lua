SMODS.Joker{ --Queen Never Cry
    key = "queennevercry",
    config = {
        extra = {
            Xmult = 12
        }
    },
    loc_txt = {
        ['name'] = 'Queen Never Cry',
        ['text'] = {
            [1] = '{X:red,C:white}X12{} Mult if the card scored is {C:hearts}Heart{} {C:attention}Queen{} with {C:rare}Red{} Seal and {C:attention}Lucky{}',
            [2] = '{C:enhanced}Enhanced{} Polychrome {C:edition}Edition{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "shit_shitpost",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_SEALS["Red"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"Red\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["m_lucky"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_lucky\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_2 = G.P_CENTERS["e_polychrome"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_polychrome\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 12 and context.other_card:is_suit("Hearts") and SMODS.get_enhancements(context.other_card)["m_lucky"] == true and context.other_card.edition and context.other_card.edition.key == "e_polychrome" and context.other_card.seal == "Red") then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}