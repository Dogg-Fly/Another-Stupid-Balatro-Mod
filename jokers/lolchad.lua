SMODS.Joker{ --Lol Chad
    key = "lolchad",
    config = {
        extra = {
            repetitions = 2
        }
    },
    loc_txt = {
        ['name'] = 'Lol Chad',
        ['text'] = {
            [1] = 'Retrigger {C:orange}ALL{} played card used in scoring {C:orange}2{} additional times'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            return {
                repetitions = card.ability.extra.repetitions,
                message = localize('k_again_ex')
            }
        end
    end
}