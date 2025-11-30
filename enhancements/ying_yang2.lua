SMODS.Enhancement {
    key = 'ying_yang2',
    pos = { x = 3, y = 0 },
    loc_txt = {
        name = 'Ying Yang',
        text = {
        [1] = 'Swap {C:blue}Chips{} with {C:red}Mult{}'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = true,
    replace_base_card = true,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 1.25,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { swap = true }
        end
    end
}