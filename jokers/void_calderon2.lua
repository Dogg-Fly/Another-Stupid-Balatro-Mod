SMODS.Joker{ --Void Calderon
    key = "void_calderon2",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Void Calderon',
        ['text'] = {
            [1] = '{C:dark_edition}Momo donde te cortaste para no ir{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "shit_shitpost",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                func = function()
                    card:undefined()
                    return true
                    end
                }
            end
        end
}