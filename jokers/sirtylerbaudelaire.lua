SMODS.Joker{ 
    key = "sirtylerbaudelaire",
    config = {
        extra = {
            chips_min = 1,
            chips_max = 50
        }
    },
    loc_txt = {
        ['name'] = 'Sir Tyler Baudelaire',
        ['text'] = {
            [1] = ' '
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 14
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
    pools = { ["shit_tyler"] = true },

    loc_vars = function(self, info_queue, card)
        local r_chips = {}
        for i = card.ability.extra.chips_min, card.ability.extra.chips_max do
            r_chips[#r_chips + 1] = "+" .. tostring(i)
        end
        
        main_start = {
            { 
                n = G.UIT.O, 
                config = { 
                    object = DynaText({ 
                        string = r_chips, 
                        colours = { G.C.BLUE }, 
                        pop_in_rate = 9999999, 
                        silent = true, 
                        random_element = true, 
                        pop_delay = 0.5, 
                        scale = 0.4, 
                        min_cycle_time = 0 
                    }) 
                } 
            }
        }
        
        return { main_start = main_start }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = pseudorandom('chips_eae713eb', card.ability.extra.chips_min, card.ability.extra.chips_max),
                }
        end
    end
}