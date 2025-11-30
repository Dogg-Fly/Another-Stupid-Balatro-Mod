SMODS.Joker{ --Bus
    key = "bus2",
    config = {
        extra = {
            multvar = 0
        }
    },
    loc_txt = {
        ['name'] = 'Bus',
        ['text'] = {
            [1] = 'This Joker gains {C:chips}+3{} Chips per {C:orange}consecutive{} hand played without a scoring {C:orange}Ace{}, {C:attention}Two{} and {C:attention}Three{}',
            [2] = '{C:inactive}(Currently [[#1#]] Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 6
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

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multvar}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local rankFound = true
                for i, c in ipairs(context.full_hand) do
                    if c:get_id() == 14 then
                        rankFound = false
                        break
                    end
                end
                
                return rankFound
                end)() and (function()
                    local rankFound = true
                    for i, c in ipairs(context.full_hand) do
                        if c:get_id() == 2 then
                            rankFound = false
                            break
                        end
                    end
                    
                    return rankFound
                    end)() and (function()
                        local rankFound = true
                        for i, c in ipairs(context.full_hand) do
                            if c:get_id() == 3 then
                                rankFound = false
                                break
                            end
                        end
                        
                        return rankFound
                        end)()) then
                            card.ability.extra.multvar = (card.ability.extra.multvar) + 3
                            return {
                                chips = card.ability.extra.multvar
                            }
                        elseif ((function()
                            local rankCount = 0
                            for i, c in ipairs(context.full_hand) do
                                if c:get_id() == 14 then
                                    rankCount = rankCount + 1
                                end
                            end
                            
                            return rankCount >= 1
                            end)() and (function()
                                local rankFound = true
                                for i, c in ipairs(context.full_hand) do
                                    if c:get_id() == 2 then
                                        rankFound = false
                                        break
                                    end
                                end
                                
                                return rankFound
                                end)() and (function()
                                    local rankFound = true
                                    for i, c in ipairs(context.full_hand) do
                                        if c:get_id() == 3 then
                                            rankFound = false
                                            break
                                        end
                                    end
                                    
                                    return rankFound
                                    end)()) then
                                        card.ability.extra.multvar = 0
                                    end
                                end
                            end
}