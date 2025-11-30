SMODS.Joker{ --Perkegod
    key = "perkegod",
    config = {
        extra = {
            repetitions = 30
        }
    },
    loc_txt = {
        ['name'] = 'Perkegod',
        ['text'] = {
            [1] = 'Create {C:dark_edition}Negative{} copies of {C:attention}1{} random {C:attention}consumable{} card',
            [2] = 'in your possession at the end of the {C:attention}shop{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = "shit_destructive",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 11
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["e_negative"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_negative\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
    if context.ending_shop  then
        if true then
            for i = 1, card.ability.extra.repetitions do
                    SMODS.calculate_effect({func = function()
                        local target_cards = {}
                        for i, consumable in ipairs(G.consumeables.cards) do
                            table.insert(target_cards, consumable)
                        end
                        if #target_cards > 0  then
                            local card_to_copy = pseudorandom_element(target_cards, pseudoseed('copy_consumable'))
                            
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                local copied_card = copy_card(card_to_copy)
                                copied_card:set_edition("e_negative", true)
                                copied_card:add_to_deck()
                                G.consumeables:emplace(copied_card)
                                
                                return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Copied Consumable!", colour = G.C.GREEN})
                        end
                        return true
                        end}, card)
                    end
                end
            end
        end
}