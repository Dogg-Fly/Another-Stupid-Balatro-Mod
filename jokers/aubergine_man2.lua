SMODS.Joker{ --Aubergine man
    key = "aubergine_man2",
    config = {
        extra = {
            odds = 4,
            shit_dave = 0
        }
    },
    loc_txt = {
        ['name'] = 'Aubergine man',
        ['text'] = {
            [1] = '{C:tarot}Creates a random card with every shit{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "shit_shitpost",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            if true then
                return {
                    func = function()
                        local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                        local new_card = create_playing_card({
                        front = card_front,
                        center = 
                        pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_hand_enhancement'))
                    }, G.discard, true, false, nil, true)
                    new_card:set_seal(pseudorandom_element({'Gold','Red','Blue','Purple','shit_blobby_seal2','shit_cake_seal2','shit_cristal_seal2','shit_simple_seal2','shit_ulty_seal2','shit_white_steak2','shit_ying_yang_seal2'}, pseudoseed('add_card_hand_seal')), true)
                    new_card:set_edition(pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative','e_shit_interference2','e_shit_error2'}, pseudoseed('add_card_hand_edition')), true)
                    
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
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_4aef214c', 1, card.ability.extra.odds, 'j_shit_aubergine_man2', false) then
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                play_sound("shit_dave")
                                
                                return true
                                end,
                            }))
                            
                        end
                        return true
                        end
                    }
                end
            end
        end
}