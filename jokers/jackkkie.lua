SMODS.Joker{ --Jackkkie
    key = "jackkkie",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Jackkkie',
        ['text'] = {
            [1] = 'on the first discard, destroy the card and create a Negative Jack.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 7
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

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["e_negative"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_negative\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.discard  then
            if G.GAME.current_round.discards_used <= 0 then
                suit_prefix = 'r'
                rank_suffix = 'J'
                local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                local new_card = create_playing_card({
                front = card_front,
                center = 
                G.P_CENTERS.c_base
            }, G.discard, true, false, nil, true)
            new_card:set_edition("e_negative", true)
            
            G.E_MANAGER:add_event(Event({
            func = function()
                new_card:start_materialize()
                G.play:emplace(new_card)
                return true
                end
            }))
            return {
                remove = true,
                message = "Destroyed!",
                extra = {
                func = function()
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                        end
                    }))
                    draw_card(G.play, G.deck, 90, 'up')
                        SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                    end,
                    message = "Added Card!",
                    colour = G.C.GREEN
                }
            }
        end
    end
end
}