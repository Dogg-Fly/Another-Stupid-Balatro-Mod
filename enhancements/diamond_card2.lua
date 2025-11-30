SMODS.Enhancement {
    key = 'diamond_card2',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            x_chips = 1.5
        }
    },
    loc_txt = {
        name = 'Diamond Card',
        text = {
        [1] = '{X:blue,C:white}X1.5{} Chips while this card stays in hand'
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
    weight = 5,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            return { x_chips = card.ability.extra.x_chips }
        end
    end
}