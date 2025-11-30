SMODS.Seal {
    key = 'cristal_seal2',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            x_mult = 2,
            retrigger_times = 1,
            odds = 2
        }
    },
    badge_colour = HEX('737373'),
   loc_txt = {
        name = 'Cristal Seal',
        label = 'Cristal Seal',
        text = {
        [1] = '{X:red,C:white}X2{} Mult and retrigger, {C:green}#1# in #2# {}chance to destroy this card'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.seal.extra.odds, 'shit_cristal_seal2')
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
        if context.repetition and card.should_retrigger then
            return { repetitions = card.ability.seal.extra.retrigger_times }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            card.should_retrigger = false
            card.should_retrigger = true
            SMODS.calculate_effect({x_mult = card.ability.seal.extra.x_mult}, card)
            if SMODS.pseudorandom_probability(card, 'group_0_a1cedac3', 1, card.ability.seal.extra.odds, 'm_shit_cristal_seal2') then
                card.should_destroy = true
            end
        end
    end
}