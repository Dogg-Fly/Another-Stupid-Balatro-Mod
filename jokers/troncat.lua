SMODS.Joker{ --Troncat 
    key = "troncat",
    config = {
        extra = {
            ethereal = 0
        }
    },
    loc_txt = {
        ['name'] = 'Troncat ',
        ['text'] = {
            [1] = 'if you keep a {C:attention}Stone{} card at the end of the round, it creates an Ethereal Tag.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["shit_tyler"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_stone"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_stone\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_TAGS["tag_ethereal"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"tag_ethereal\" isn't a valid Tag key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
    if context.cardarea == G.hand and context.end_of_round  then
        if SMODS.get_enhancements(context.other_card)["m_stone"] == true then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        local tag = Tag("tag_ethereal")
                        if tag.name == "Orbital Tag" then
                            local _poker_hands = {}
                            for k, v in pairs(G.GAME.hands) do
                                if v.visible then
                                    _poker_hands[#_poker_hands + 1] = k
                                end
                            end
                            tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                        end
                        tag:set_ability()
                        add_tag(tag)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                        end
                    }))
                    return true
                    end,
                    message = "Created Tag!"
                }
            end
        end
    end
}