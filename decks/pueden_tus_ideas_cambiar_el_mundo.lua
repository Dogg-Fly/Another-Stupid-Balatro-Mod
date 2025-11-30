SMODS.Back {
    key = 'pueden_tus_ideas_cambiar_el_mundo',
    pos = { x = 1, y = 0 },
    config = {
      joker_slots_value = 1,
        repetitions = 4,
},
    loc_txt = {
        name = 'Pueden tus ideas cambiar el mundo?',
        text = {
            [1] = 'Start with a Eternal 4 {C:attention}Jokers{} and {C:attention}Perkegod{}',
            [2] = '{C:dark_edition}+1 Joker Slot{}'
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
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_shit_perkegod' })
                      if new_joker then
                          new_joker:add_sticker('eternal', true)
                      end
                          G.GAME.joker_buffer = 0
                      end
                      return true
                  end
              }))
            for i = 1, self.config.repetitions do
              
                G.E_MANAGER:add_event(Event({
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                      if new_joker then
                          new_joker:add_sticker('eternal', true)
                      end
                          G.GAME.joker_buffer = 0
                      end
                      return true
                  end
              }))
          end
            G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 1
    end
}