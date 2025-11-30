SMODS.Seal {
    key = 'ying_yang_seal2',
    pos = { x = 6, y = 0 },
    badge_colour = HEX('4a4a4a'),
   loc_txt = {
        name = 'Ying Yang Seal',
        label = 'Ying Yang Seal',
        text = {
        [1] = '{C:purple}Balance{} {C:blue}Chips{} with {C:red}Mult{}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { balance = true }
        end
    end
}