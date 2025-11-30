SMODS.Consumable {
    key = 'ghosty2',
    set = 'spot',
    pos = { x = 0, y = 2 },
    config = { extra = {
        edition_amount = 70,
        joker_slots_value = 2
    } },
    loc_txt = {
        name = 'Ghosty',
        text = {
        [1] = 'Add {C:dark_edition}Negative{} to all {C:attention}Jokers{},',
        [2] = '{C:red}-2{} Joker slot'
    }
    },
    cost = 4,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            local jokers_to_edition = {}
            local eligible_jokers = {}
            
            if 'editionless' == 'editionless' then
                eligible_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
            else
                for _, joker in pairs(G.jokers.cards) do
                    if joker.ability.set == 'Joker' then
                        eligible_jokers[#eligible_jokers + 1] = joker
                    end
                end
            end
            
            if #eligible_jokers > 0 then
                local temp_jokers = {}
                for _, joker in ipairs(eligible_jokers) do 
                    temp_jokers[#temp_jokers + 1] = joker 
                end
                
                pseudoshuffle(temp_jokers, 76543)
                
                for i = 1, math.min(card.ability.extra.edition_amount, #temp_jokers) do
                    jokers_to_edition[#jokers_to_edition + 1] = temp_jokers[i]
                end
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            for _, joker in pairs(jokers_to_edition) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        joker:set_edition('e_negative', true)
                        return true
                    end
                }))
            end
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "-"..tostring(2).." Joker Slot", colour = G.C.RED})
                    G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - 2)
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}