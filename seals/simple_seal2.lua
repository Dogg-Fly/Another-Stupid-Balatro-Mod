SMODS.Seal {
    key = 'simple_seal2',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            mult = 15,
            odds = 2,
            dollars = 2
        }
    },
    badge_colour = HEX('da73ff'),
   loc_txt = {
        name = 'Simple Seal',
        label = 'Simple Seal',
        text = {
        [1] = '{C:red}+15{} Mult, {C:green}#1# in #2#{} chance to add {C:money}$5{}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.seal.extra.odds, 'shit_simple_seal2')
        return {vars = {numerator, denominator}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_1f62f56c', 1, card.ability.seal.extra.odds, 'm_shit_simple_seal2') then
                SMODS.calculate_effect({dollars = lenient_bignum(card.ability.seal.extra.dollars)}, card)
            end
            return { mult = card.ability.seal.extra.mult }
        end
    end
}