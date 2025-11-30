SMODS.Joker{ --Oxidation
    key = "oxidation",
    config = {
        extra = {
            pb_x_mult_546bed6e = 1.5,
            perma_x_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Oxidation',
        ['text'] = {
            [1] = 'Every played {C:attention}Steel card{} permanently',
            [2] = 'gains {X:red,C:white}X1.5{} Chips when scored and loses {C:attention}Enhancement{} when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_steel"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_steel\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + card.ability.extra.pb_x_mult_546bed6e
                context.other_card:set_ability(G.P_CENTERS.c_base)
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card,
                    extra = {
                    message = "Card Modified!",
                        colour = G.C.BLUE
                    }
                }
            end
        end
    end
}