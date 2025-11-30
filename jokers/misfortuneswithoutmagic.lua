SMODS.Joker{ --Misfortunes Without Magic
    key = "misfortuneswithoutmagic",
    config = {
        extra = {
            mult = 50
        }
    },
    loc_txt = {
        ['name'] = 'Misfortunes Without Magic',
        ['text'] = {
            [1] = '{C:red}+50{} Mult for each played card without enchantment'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if not ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                        end
                    end
                    return false
                    end)()) then
                        return {
                            mult = card.ability.extra.mult
                        }
                    end
                end
            end
}