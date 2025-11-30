SMODS.Consumable {
    key = 'quit2',
    set = 'ultrarot',
    pos = { x = 6, y = 4 },
    config = { extra = {
        dollars_value = 10
    } },
    loc_txt = {
        name = 'Quit',
        text = {
            [1] = 'Remove {C:dark_edition}Edition{}',
            [2] = 'from a selected joker',
            [3] = 'Gain {C:money}$10{}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.jokers.highlighted == 1 then
            local joker = G.jokers.highlighted[1]
            
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    joker:set_edition(nil, true)
                    
                    card_eval_status_text(joker, 'extra', nil, nil, nil, {
                        message = "Edition Removed!", 
                        colour = G.C.FILTER
                    })
                    return true
                end
            }))
            
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {
                        message = "+$"..tostring(self.config.extra.dollars_value), 
                        colour = G.C.MONEY
                    })
                    ease_dollars(self.config.extra.dollars_value, true)
                    return true
                end
            }))
        end
    end,
    
    can_use = function(self, card)
        if #G.jokers.highlighted ~= 1 then
            return false
        end
        
        local joker = G.jokers.highlighted[1]
        if joker.edition then
            return true
        end
        
        return false
    end
}