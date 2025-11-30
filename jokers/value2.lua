SMODS.Joker{ --Value
    key = "value2",
    config = {
        extra = {
            sell_value_min = 1,
            sell_value_max = 25
        }
    },
    loc_txt = {
        ['name'] = 'Value',
        ['text'] = {
            [1] = 'Sell value changes from {C:attention}$1-25{} Dollars whean a blind is selected'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    target_card.ability.extra_value = (card.ability.extra_value or 0) + pseudorandom('sell_value_3c627200', card.ability.extra.sell_value_min, card.ability.extra.sell_value_max)
                    target_card:set_cost()
                    return true
                    end,
                    message = "undefined+"..tostring(pseudorandom('sell_value_3c627200', card.ability.extra.sell_value_min, card.ability.extra.sell_value_max)).." Sell Value"
                }
            end
        end
}