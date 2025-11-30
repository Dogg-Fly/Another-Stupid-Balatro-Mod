SMODS.Joker{ --Mateoe
    key = "mateoe",
    config = {
        extra = {
            Xmult = 2,
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Mateoe',
        ['text'] = {
            [1] = '{C:attention}Lucky{} cards give {X:red,C:white}X2{} Mult, retrigger the {C:attention}Steel{} cards in your hand'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_lucky"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_lucky\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["m_steel"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_steel\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if SMODS.get_enhancements(playing_card)["m_lucky"] == true then
                        count = count + 1
                    end
                end
                return count == 1
                end)() then
                    return {
                        Xmult = card.ability.extra.Xmult
                    }
                end
            end
            if context.repetition and context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1)  then
                if SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                    return {
                        repetitions = card.ability.extra.repetitions,
                        message = localize('k_again_ex')
                    }
                end
            end
        end
}