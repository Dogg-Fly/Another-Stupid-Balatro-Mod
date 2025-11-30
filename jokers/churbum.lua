SMODS.Joker{ --Chur Bum
    key = "churbum",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Chur Bum',
        ['text'] = {
            [1] = '{C:attention}first{} {C:red}discard{} create a {C:attention}Rare tag{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
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
    pools = { ["shit_tyler"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_TAGS["tag_rare"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"tag_rare\" isn't a valid Tag key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.pre_discard  then
            if G.GAME.current_round.discards_used <= 0 then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            local tag = Tag("tag_rare")
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
                        message = "Cherry Bomb"
                    }
                end
            end
        end
}