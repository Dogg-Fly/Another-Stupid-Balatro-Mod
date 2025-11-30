SMODS.Seal {
    key = 'cake_seal2',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            levels_min = 1,
            levels_max = 5,
            odds = 4
        }
    },
    badge_colour = HEX('96CEB4'),
   loc_txt = {
        name = 'Cake Seal',
        label = 'Cake Seal',
        text = {
        [1] = 'Level up a random hand (1 or 5 levels), {C:green}#1# in #2# {}chance destroy this card'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.seal.extra.odds, 'shit_cake_seal2')
        return {vars = {numerator, denominator}}
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:start_dissolve()
                    return true
                end
            }))
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Destroyed!", colour = G.C.RED})
            return
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            local target_hand
                
                local available_hands = {}
                for hand, value in pairs(G.GAME.hands) do
                  if value.visible and value.level >= to_big(1) then
                    table.insert(available_hands, hand)
                  end
                end
                target_hand = #available_hands > 0 and pseudorandom_element(available_hands, pseudoseed('level_up_hand_enhanced')) or "High Card"
            SMODS.calculate_effect({level_up = pseudorandom('levels_9202fa8d', card.ability.seal.extra.levels_min, card.ability.seal.extra.levels_max),
                level_up_hand = target_hand}, card)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex'), colour = G.C.RED})
            if SMODS.pseudorandom_probability(card, 'group_0_952a5394', 1, card.ability.seal.extra.odds, 'm_shit_cake_seal2') then
                card.should_destroy = true
            end
        end
    end
}