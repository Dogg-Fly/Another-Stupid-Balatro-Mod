SMODS.Joker{ --Omega Smiley
    key = "omega_smiley2",
    config = {
        extra = {
            dede = 0
        }
    },
    loc_txt = {
        ['name'] = 'Omega Smiley',
        ['text'] = {
            [1] = 'WHY IS SMILEY THERE',
            [2] = 'if you have a 3 in your hand at the end of the round add {C:red}+33{} Mult',
            [3] = '{C:inactive}(Currently {C:red}+#1#{}{C:inactive}){} {}',
            [4] = '{C:inactive}(Smiley from Frushtro){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 10
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

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.dede}}
    end,

    
    calculate = function(self, card, context)
    if context.cardarea == G.hand and context.end_of_round  then
        if context.other_card:get_id() == 3 then
            return {
                func = function()
                    card.ability.extra.dede = (card.ability.extra.dede) + 33
                    return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.dede
            }
        end
    end
}