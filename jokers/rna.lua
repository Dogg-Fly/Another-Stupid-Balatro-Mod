SMODS.Joker{ --RNA
    key = "rna",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'RNA',
        ['text'] = {
            [1] = 'If {C:attention}LAST hand{} of round has only {C:attention}1{} card,',
            [2] = 'then make the card Polychrome, copy to deck and draw it to {C:attention}hand{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
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

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if G.GAME.current_round.hands_left == 0 then
                context.other_card:set_edition("e_polychrome", true)
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                copied_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copied_card)
                G.hand:emplace(copied_card)
                copied_card.states.visible = nil
                
                G.E_MANAGER:add_event(Event({
                func = function() 
                    copied_card:start_materialize()
                    return true
                    end
                }))
                return {
                    message = "Card Modified!",
                        extra = {
                        message = "Copied Card to Hand!",
                        colour = G.C.GREEN
                    }
                }
            end
        end
    end
}