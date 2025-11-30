SMODS.Joker{ --Big Poe
    key = "bigpoe",
    config = {
        extra = {
            Xmult = 2,
            mult = 21
        }
    },
    loc_txt = {
        ['name'] = 'Big Poe',
        ['text'] = {
            [1] = '{C:red}+21{} Mult',
            [2] = '{X:red,C:white}X2{} Mult if you have any Tyler, The Joker'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["shit_tyler"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_shit_tylerthejoker"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_shit_tylerthejoker\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_shit_samisdead"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_shit_samisdead\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_2 = G.P_CENTERS["j_shit_wolf_haley2"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_shit_wolf_haley2\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_3 = G.P_CENTERS["j_shit_churbum"]
        if info_queue_3 then
            info_queue[#info_queue + 1] = info_queue_3
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_shit_churbum\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_4 = G.P_CENTERS["j_shit_igor2"]
        if info_queue_4 then
            info_queue[#info_queue + 1] = info_queue_4
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_shit_igor\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_5 = G.P_CENTERS["j_shit_troncat"]
        if info_queue_5 then
            info_queue[#info_queue + 1] = info_queue_5
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_shit_troncat\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_6 = G.P_CENTERS["j_shit_st_chroma2"]
        if info_queue_6 then
            info_queue[#info_queue + 1] = info_queue_6
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_shit_stchroma\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_7 = G.P_CENTERS["j_shit_sirtylerbaudelaire"]
        if info_queue_7 then
            info_queue[#info_queue + 1] = info_queue_7
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_shit_sirtylerbaudelaire\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_8 = G.P_CENTERS["j_shit_flower_boy2"]
        if info_queue_8 then
            info_queue[#info_queue + 1] = info_queue_8
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_shit_flowerboy\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_9 = G.P_CENTERS["j_shit_acethejoker"]
        if info_queue_9 then
            info_queue[#info_queue + 1] = info_queue_9
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_shit_acethejoker\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_shit_tylerthejoker" then
              return true
          end
      end
      return false
  end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_shit_churbum" then
              return true
          end
      end
      return false
  end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_shit_igor2" then
              return true
          end
      end
      return false
  end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_shit_flower_boy2" then
              return true
          end
      end
      return false
  end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_shit_wolfhaley" then
              return true
          end
      end
      return false
  end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_shit_sirtylerbaudelaire" then
              return true
          end
      end
      return false
  end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_shit_acetyler" then
              return true
          end
      end
      return false
  end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_shit_st_chroma2" then
              return true
          end
      end
      return false
  end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_shit_dctc" then
              return true
          end
      end
      return false
  end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_shit_troncat" then
              return true
          end
      end
      return false
  end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_shit_samisdead" then
              return true
          end
      end
      return false
  end)()) then
                return {
                    Xmult = card.ability.extra.Xmult,
                    message = "DONT TAP THE GLASS"
                }
            else
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}