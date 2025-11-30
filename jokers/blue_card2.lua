SMODS.Joker{ --Blue Card
    key = "blue_card2",
    config = {
        extra = {
            multvar = 0
        }
    },
    loc_txt = {
        ['name'] = 'Blue Card',
        ['text'] = {
            [1] = 'This Joker gains {C:chips}+4{} Chips when any {C:orange}Booster Pack{} is skipped',
            [2] = '{C:inactive}(Currently {C:blue}+#1#{} {C:inactive}Chips){}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multvar}}
    end,

    
    calculate = function(self, card, context)
        if context.skipping_booster  then
            return {
                func = function()
                    card.ability.extra.multvar = (card.ability.extra.multvar) + 4
                    return true
                    end
                }
            end
            if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.multvar
                }
            end
        end
}