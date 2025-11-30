SMODS.Joker{ --¡UNO!
    key = "uno",
    config = {
        extra = {
            wildcardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = '¡UNO!',
        ['text'] = {
            [1] = '{C:red}+4{} Mult for each {C:attention}Wild{} card in your {C:attention}deck{}',
            [2] = '{C:inactive}(Currently {C:red}+#1#{} {C:inactive}Mult){}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
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
        return {vars = {((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_wild') then count = count + 1 end end; return count end)()) * 4}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
            mult = ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_wild') then count = count + 1 end end; return count end)()) * 4
            }
        end
    end
}