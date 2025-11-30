SMODS.Edition {
    key = 'interference2',
    shader = false,
    in_shop = true,
    weight = 2.75,
    apply_to_float = true,
    badge_colour = HEX('787878'),
    sound = { sound = "card1", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Interference',
        label = 'Interference',
        text = {
            [1] = 'Changes the {C:attention}suit{}',
            [2] = 'of played hands'
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
  
    calculate = function(self, card, context)
        if context.joker_main and card.ability.set == 'Joker' then
            if context.scoring_hand then
                for i = 1, #context.scoring_hand do
                    local scored_card = context.scoring_hand[i]
                    if scored_card and not scored_card.debuff then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local new_suit = pseudorandom_element(SMODS.Suits, pseudoseed('interference'..G.GAME.round_resets.ante)).key
                                assert(SMODS.change_base(scored_card, new_suit, nil))
                                return true
                            end
                        }))
                    end
                end
            end
        end
    end
}
