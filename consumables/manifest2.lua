SMODS.Consumable {
    key = 'manifest2',
    set = 'ultrarot',
    pos = { x = 5, y = 2 },
    config = { extra = {
        joker_limit = 2,
        joker_money = 0
    } },
    loc_txt = {
        name = 'Manifest',
        text = {
        [1] = 'Gives {C:money}5{} Dollars and create a {C:tarot}The Hermit{}'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            local money = 0
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.set == 'Joker' then
                    money = money + G.jokers.cards[i].sell_cost
                end
            end
            card.ability.extra.joker_money = math.min(money, 2)

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    ease_dollars(card.ability.extra.joker_money, true)
                    return true
                end
            }))
            delay(0.6)
            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
  
            play_sound('timpani')
            SMODS.add_card({ set = 'Tarot', key = 'c_hermit'})                            
            used_card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                      if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
    end,
    can_use = function(self, card)
        return true
    end
}