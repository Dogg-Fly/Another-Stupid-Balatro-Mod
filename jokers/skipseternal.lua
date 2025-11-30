SMODS.Joker{ --Skips Eternal
    key = "skipseternal",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Skips Eternal',
        ['text'] = {
            [1] = 'Create {C:dark_edition}Negative{} Tag when skip a blind'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_TAGS["tag_negative"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"tag_negative\" isn't a valid Tag key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    set_ability = function(self, card, initial)
        card:add_sticker('rental', true)
        card:set_edition("e_negative", true)
    end,

    
    calculate = function(self, card, context)
        if context.skip_blind  then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        local tag = Tag("tag_negative")
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
}