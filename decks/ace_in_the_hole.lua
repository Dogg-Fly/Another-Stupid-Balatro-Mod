SMODS.Back {
    key = 'ace_in_the_hole',
    pos = { x = 4, y = 0 },
    config = {
      destroy_count = 52,
        add_starting_cards_count = 13,
        base_blind_size_value = 2,
},
    loc_txt = {
        name = 'Ace in the hole',
        text = {
            [1] = 'ALLL CARDS ARE ACES X2 BLIND REQUERIMENTS'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
     apply = function(self, back)
            G.E_MANAGER:add_event(Event({
                delay = 0.3,
                func = function()
                    local cards = {}
                    for i = 1, 13 do
                        local _rank = 'Ace'
                        local _suit = 'Spades'
                        local new_card_params = { set = "Base", area = G.deck }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        cards[i] = SMODS.add_card(new_card_params)
                        if cards[i] then
                            cards[i]:set_edition( "none", true, true, true)
                        end
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                delay = 0.3,
                func = function()
                    local cards = {}
                    for i = 1, 13 do
                        local _rank = 'Ace'
                        local _suit = 'Hearts'
                        local new_card_params = { set = "Base", area = G.deck }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        cards[i] = SMODS.add_card(new_card_params)
                        if cards[i] then
                            cards[i]:set_edition( "none", true, true, true)
                        end
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                delay = 0.3,
                func = function()
                    local cards = {}
                    for i = 1, 13 do
                        local _rank = 'Ace'
                        local _suit = 'Diamonds'
                        local new_card_params = { set = "Base", area = G.deck }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        cards[i] = SMODS.add_card(new_card_params)
                        if cards[i] then
                            cards[i]:set_edition( "none", true, true, true)
                        end
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                delay = 0.3,
                func = function()
                    local cards = {}
                    for i = 1, 13 do
                        local _rank = 'Ace'
                        local _suit = 'Clubs'
                        local new_card_params = { set = "Base", area = G.deck }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        cards[i] = SMODS.add_card(new_card_params)
                        if cards[i] then
                            cards[i]:set_edition( "none", true, true, true)
                        end
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            G.GAME.starting_params.dollars = G.GAME.starting_params.dollars +10
            G.E_MANAGER:add_event(Event({
                func = function()
                for i=#G.deck.cards, 1, -1 do
                G.deck.cards[i]:remove()
            end
            return true
        end
    }))
            
            G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 2
    end
}