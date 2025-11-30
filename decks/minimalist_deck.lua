SMODS.Back({
    key = "minimalist_deck",
    loc_txt = {
        name = "Minimalist Deck",
        text = {
            "Only {C:attention}20 cards{} in your deck",
            "Every card give {C:mult}+2 Mult{} per base",
            "{C:money}+$15{} extra"
        }
    },
    atlas = "CustomDecks",
    pos = { x = 3, y = 0 },
    config = {
        dollars = 15
    },
    unlocked = true,
    discovered = true,
    
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                
                for i = #G.playing_cards, 1, -1 do
                    local card = G.playing_cards[i]
                    if card then
                        card:remove()
                        table.remove(G.playing_cards, i)
                    end
                end
                
                if G.deck and G.deck.cards then
                    for i = #G.deck.cards, 1, -1 do
                        G.deck.cards[i] = nil
                    end
                end
                
                local suits = {'H', 'D', 'C', 'S'}
                local high_ranks = {'T','J','Q','K','A'}
                
                for _, suit in pairs(suits) do
                    for _, rank in pairs(high_ranks) do
                        local card_key = suit..'_'..rank
                        local card = Card(G.deck.T.x, G.deck.T.y, G.CARD_W, G.CARD_H, 
                            G.P_CARDS[card_key], G.P_CENTERS.c_base)
                        card:add_to_deck()
                        table.insert(G.playing_cards, card)
                        G.deck:emplace(card)
                    end
                end
                
                G.GAME.minimalist_deck_active = true
                
                if G.deck and G.deck.cards then
                    G.deck:shuffle('minimalist_start')
					
                    G.deck:hard_set_T()
					end
                
                return true
            end,
        }))
    end
})

local original_get_chip_mult = Card.get_chip_mult
function Card:get_chip_mult()
    local mult, chips = original_get_chip_mult(self)
    
    if G.GAME and G.GAME.minimalist_deck_active and not self.debuff then
        mult = mult + 2
    end
    
    return mult, chips
end
