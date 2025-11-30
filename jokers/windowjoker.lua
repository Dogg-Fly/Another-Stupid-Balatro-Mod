SMODS.Joker{ --Window Joker
    key = "windowjoker",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Window Joker',
        ['text'] = {
            [1] = 'Adds one {C:orange}Glass{} card to the hand when {C:orange}Blind{} is selected'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 16
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
        
        local info_queue_0 = G.P_CENTERS["m_glass"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_glass\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local new_card = create_playing_card({
                    front = card_front,
                    center = 
                    G.P_CENTERS.m_glass
                }, G.discard, true, false, nil, true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                new_card.playing_card = G.playing_card
                table.insert(G.playing_cards, new_card)
                
                G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand:emplace(new_card)
                    new_card:start_materialize()
                        SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                        return true
                        end
                    }))
                end,
                message = "Added Card to Hand!"
            }
        end
    end
}