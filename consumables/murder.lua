SMODS.Consumable {
    key = 'murder',
    set = 'spot',
    pos = { x = 7, y = 2 },
    loc_txt = {
        name = 'Murder',
        text = {
        [1] = 'Creates a {C:dark_edition}Negative{} {C:spectral}Destructive{} Joker'
    }
    },
    cost = 4,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    soul_pos = {
        x = 8,
        y = 2
    },use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'shit_destructive' })
                      if new_joker then
                          new_joker:set_edition("e_negative", true)
                      end
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}