SMODS.Joker{ --Ruin
    key = "ruin2",
    config = {
        extra = {
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Ruin',
        ['text'] = {
            [1] = 'If {C:orange}poker hand{} is a {C:orange}Flush House{}, create a random {C:spectral}Spot{} card',
            [2] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 13
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Flush House" then
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('timpani')
                        SMODS.add_card({ set = 'spot', })                            
                        card:juice_up(0.3, 0.5)
                        return true
                        end
                    }))
                end
                delay(0.6)
                return {
                    message = created_consumable and localize('k_plus_consumable') or nil
                }
            end
        end
    end
}