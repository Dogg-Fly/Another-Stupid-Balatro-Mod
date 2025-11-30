SMODS.Consumable {
    key = 'shift2',
    set = 'Spectral',
    pos = { x = 9, y = 3 },
    config = { extra = {
        odds = 8
    } },
    loc_txt = {
        name = 'Shift',
        text = {
        [1] = 'Create a BLOB'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_shit_blob2' })
                      if new_joker then
                          new_joker:set_edition("e_negative", true)
                      end
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
            if SMODS.pseudorandom_probability(card, 'group_0_866d73e2', 1, card.ability.extra.odds, 'c_shit_shift2', false) then
                
                G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_shit_multblob2' })
                      if new_joker then
                      end
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
            end
    end,
    can_use = function(self, card)
        return true
    end
}