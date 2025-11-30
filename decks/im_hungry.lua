SMODS.Back {
    key = 'im_hungry',
    pos = { x = 2, y = 0 },
    config = {
},
    loc_txt = {
        name = 'Im Hungry',
        text = {
            [1] = 'Start with a Eternal {C:attention}Fatass Misprint{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
     apply = function(self, back)
            G.E_MANAGER:add_event(Event({
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_shit_fatassmisprint' })
                      if new_joker then
                      end
                          G.GAME.joker_buffer = 0
                      end
                      return true
                  end
              }))
    end
}