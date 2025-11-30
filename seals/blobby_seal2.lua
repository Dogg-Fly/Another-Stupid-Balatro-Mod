SMODS.Seal {
    key = 'blobby_seal2',
    pos = { x = 0, y = 0 },
    badge_colour = HEX('00fffb'),
   loc_txt = {
        name = 'Blobby Seal',
        label = 'Blobby Seal',
        text = {
        [1] = 'When this card is discard create a {C:blue}Blob{}',
        [2] = '{C:inactive}(Must have room){}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_shit_blob' })
                        if joker_card then
                            
                            
                        end
                        G.GAME.joker_buffer = 0
                        return true
                    end
                }))
                end
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
        end
    end
}
