SMODS.Joker{ --bolb
    key = "bolb2",
    config = {
        extra = {
            more = 1
        }
    },
    loc_txt = {
        ['name'] = 'bolb',
        ['text'] = {
            [1] = 'MORE CONSUMABLES SLOTS YUPPI',
            [2] = '{C:inactive}{}',
            [3] = '{C:inactive}Doggfly...{}',
            [4] = '{E:5}{s:10.7}IM A GOD{}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = "shit_blob",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({func = function()
                        G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.more
                        return true
                        end }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.more).." Consumable Slot", colour = G.C.GREEN})
                        return true
                        end
                    }
                end
            if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                        card.ability.extra.more = (card.ability.extra.more) + 1
                        return true
                        end
                    }
                end
                if context.selling_self  then
                    return {
                        func = function()
                            
                            local created_joker = false
                            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                created_joker = true
                                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_shit_meltedbolb' })
                                    if joker_card then
                                        
                                        
                                    end
                                    G.GAME.joker_buffer = 0
                                    return true
                                    end
                                }))
                            end
                            if created_joker then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                            end
                            return true
                            end
                        }
                    end
                end
}