SMODS.Joker{ --Negative Joker
    key = "negativejoker",
    config = {
        extra = {
            negativecardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Negative Joker',
        ['text'] = {
            [1] = 'Gives {C:blue}+200{} Chips for each {C:attention}Negative Card{} in your full deck',
            [2] = '{C:inactive}(Currently {C:blue}+#1#{} {C:inactive}Chips){}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 10
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
        
        local info_queue_0 = G.P_CENTERS["e_negative"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_negative\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.edition and card.edition.negative then count = count + 1 end end; return count end)()) * 200}}
    end,

    set_ability = function(self, card, initial)
        card:set_edition("e_negative", true)
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
            chips = ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.edition and card.edition.negative then count = count + 1 end end; return count end)()) * 200
            }
        end
    end
}