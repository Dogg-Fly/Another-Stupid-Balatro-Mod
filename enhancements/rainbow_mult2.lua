SMODS.Enhancement {
    key = 'rainbow_mult2',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            x_mult = 2,
            x_chips = 2
        }
    },
    loc_txt = {
        name = 'Rainbow Mult',
        text = {
        [1] = '{X:red,C:white}X2{} Mult and {X:blue,C:white}X2{} Chips'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 4,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { x_mult = card.ability.extra.x_mult, x_chips = card.ability.extra.x_chips }
        end
    end
}