SMODS.Joker{ --Jungle
    key = "jungle",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Jungle',
        ['text'] = {
            [1] = 'All played {C:orange}face{} cards become {C:orange}Wild{} cards when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_wild"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_wild\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                context.other_card:set_ability(G.P_CENTERS.m_wild)
                return {
                    message = "Card Modified!"
                    }
                end
            end
        end
}