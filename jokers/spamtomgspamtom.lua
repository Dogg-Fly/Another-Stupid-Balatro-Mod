SMODS.Joker{ --SPAMTOM G SPAMTOM
    key = "spamtomgspamtom",
    config = {
        extra = {
            cardsindeck = 0,
            odds = 5,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'SPAMTOM G SPAMTOM',
        ['text'] = {
            [1] = 'HELLO [{C:attention}New Player{}] IM SPAMTON G. SPANTOM FROM [[{C:attention}HYPERLINK BLOCKED{}]]',
            [2] = 'I HAVE 1 USE [{C:attention}Super{}] USEFUL FOR YOU OR I CAN BE YOUR WORST [{C:attention}Nightmare{}], BUY ME [{C:attention}Player Interested{}]',
            [3] = 'BUT REMBEMBER I HAVE {C:green}1 IN 5{} CHANCE TO CREATE A ETERNAL {C:blue}PIPIS{} MY LOVE.',
            [4] = 'SO YOU WANT TO BE A [[{C:attention}BIG SHOT{}]]!!!!!'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = "shit_shitpost",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_shit_pipis2"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_shit_pipis2\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_shit_spamtomgspamtom') 
        return {vars = {new_numerator, new_denominator}}
    end,

    set_ability = function(self, card, initial)
        card:add_sticker('rental', true)
    end,

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval  then
        if true then
            if SMODS.pseudorandom_probability(card, 'group_0_c9f16208', 1, card.ability.extra.odds, 'j_shit_spamtomgspamtom', false) then
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = false
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            created_joker = true
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_shit_pipis' })
                                if joker_card then
                                    
                                    
                                end
                                G.GAME.joker_buffer = 0
                                return true
                                end
                            }))
                        end
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                        end}, card)
                    end
                end
            end
        end,

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
    func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true
    end
}))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
    func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true
    end
}))
    end
}


local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    
    if next(SMODS.find_card("j_shit_spamtomgspamtom")) then
        if (self.ability.set == 'Joker' or self.ability.set == 'Tarot' or self.ability.set == 'Planet' or self.ability.set == 'Spectral' or self.ability.set == 'Enhanced' or self.ability.set == 'Booster' or self.ability.set == 'Voucher') then
            self.cost = math.max(0, self.cost - (#(G.deck and G.deck.cards or {})))
        end
    end
    
    self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
end