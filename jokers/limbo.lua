SMODS.Joker{ --Limbo
    key = "limbo",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Limbo',
        ['text'] = {
            [1] = 'Shuffle and flip all jokers',
            [2] = '{C:inactive}ITS BLUE BLUE{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = "shit_shitpost",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if #G.jokers.cards > 1 then
                G.jokers:unhighlight_all()
                G.E_MANAGER:add_event(Event({
                trigger = 'before',
                func = function()
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.jokers:shuffle('aajk')
                        play_sound('cardSlide1', 0.85)
                        return true
                        end,
                    }))
                    delay(0.15)
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.jokers:shuffle('aajk')
                        play_sound('cardSlide1', 1.15)
                        return true
                        end
                    }))
                    delay(0.15)
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.jokers:shuffle('aajk')
                        play_sound('cardSlide1', 1)
                        return true
                        end
                    }))
                    delay(0.5)
                    return true
                    end
                }))
            end
            if #G.jokers.cards > 0 then
                for _, joker in ipairs(G.jokers.cards) do
                    joker:flip()
                end
            end
            return {
                message = "Shuffle!",
                extra = {
                message = "Flip!",
                colour = G.C.ORANGE
            }
        }
    end
end
}