SMODS.Joker{ --Polychrome inside me
    key = "polychromeinsideme",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Polychrome inside me',
        ['text'] = {
            [1] = 'if scored card without {C:dark_edition}Edition{}, adds Polychrome'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["e_polychrome"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_polychrome\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    set_ability = function(self, card, initial)
        card:set_edition("e_polychrome", true)
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.edition == nil then
                context.other_card:set_edition("e_polychrome", true)
                return {
                    message = "Card Modified!"
                    }
                end
            end
        end
}