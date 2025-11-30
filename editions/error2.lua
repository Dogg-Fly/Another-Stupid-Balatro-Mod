SMODS.Shader({ key = 'flipped', path = 'flipped.fs' })

SMODS.Edition {
    key = 'error2',
    shader = 'flipped',
    config = {
        extra = {
            card_draw = 5
        }
    },
    in_shop = true,
    weight = 1,
    apply_to_float = false,
    badge_colour = HEX('419f65'),
    sound = { sound = "holo1", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Error',
        label = 'Error',
        text = {
        [1] = 'Draw 5 cards'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
  
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            if G.GAME.blind.in_blind then
    SMODS.draw_cards(card.edition.extra.card_draw)
  end
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.edition.extra.card_draw).." Cards Drawn", colour = G.C.BLUE})
        end
    end
}
