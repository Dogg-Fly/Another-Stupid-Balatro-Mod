SMODS.Seal {
    key = 'ulty_seal2',
    pos = { x = 4, y = 0 },
    badge_colour = HEX('5c4dfe'),
   loc_txt = {
        name = 'Ulty Seal',
        label = 'Ulty Seal',
        text = {
        [1] = 'When this card is discard create a random {C:tarot}Ultrarot{} card',
        [2] = '{C:inactive}(Must have room){}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            return { func = function()
    for i = 1, math.min(undefined, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = function()
            play_sound('timpani')
            SMODS.add_card({ set = 'ultrarot', })                            
            used_card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                  end }
        end
    end
}