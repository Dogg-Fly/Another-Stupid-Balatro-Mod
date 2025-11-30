SMODS.PokerHand({
    key = "pkr_four_flush",
    mult = 8,
    chips = 75,
    l_mult = 4,
    l_chips = 25,
    example = {
        { 'H_7', true },
        { 'H_7', true },
        { 'H_7', true },
        { 'H_7', true },
        { 'S_K', false }
    },
    loc_txt = {
        name = "Four Flush",
        description = {"Four cards of the same suit and rank."},
    },
    visible = true,

    evaluate = function(parts, hand)
        if #hand >= 4 then
            local card_groups = {}
            
            for i, card in ipairs(hand) do
                local key = card:get_id() .. "_" .. card.base.suit
                if not card_groups[key] then
                    card_groups[key] = {}
                end
                card_groups[key][#card_groups[key] + 1] = card
            end
            
            for key, cards in pairs(card_groups) do
                if #cards == 4 then
                    return {cards}
                end
            end
        end
        return {}
    end,

    modify_display_text = function(self, cards, scoring_hand)
        return "Four Flush"
    end,
})

SMODS.Atlas{
    key = 'fourflush_planet',
    path = 'tetrada.png',
    px = 71,
    py = 96,
}

SMODS.Atlas{
    key = 'temp',
    path = 'temp.png',
    px = 71,
    py = 96,
}

SMODS.Consumable {
    key = 'fourflush_planet',
    set = 'Planet',
    pos = { x = 0, y = 0 },
    config = { extra = {
        hand_type = "shit_pkr_four_flush",
        levels = 1
    } },
    loc_txt = {
        name = 'Tetrada',
        text = {
            "({V:1}lvl.#1#{}) Level up",
            "{C:attention}#2#",
            "{C:mult}+#3#{} Mult and",
            "{C:chips}+#4#{} chips",
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type].level,
                localize(card.ability.extra.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.extra.hand_type].l_mult * card.ability.extra.levels,
                G.GAME.hands[card.ability.extra.hand_type].l_chips * card.ability.extra.levels,
                colours = { (G.GAME.hands[card.ability.extra.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type].level)]) }
            }
        }
    end,
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'fourflush_planet',
    use = function(self, card, area, copier)
        local used_card = copier or card
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { handname = localize('shit_pkr_four_flush', 'poker_hands'), 
                  chips = G.GAME.hands['shit_pkr_four_flush'].chips, 
                  mult = G.GAME.hands['shit_pkr_four_flush'].mult, 
                  level = G.GAME.hands['shit_pkr_four_flush'].level })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = true
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = nil
                    return true
                end
            }))
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(1) })
            delay(1.3)
            level_up_hand(card, "shit_pkr_four_flush", true, 1)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize('shit_pkr_four_flush', 'poker_hands'), 
                 chips = G.GAME.hands['shit_pkr_four_flush'].chips, 
                 mult = G.GAME.hands['shit_pkr_four_flush'].mult, 
                 level=G.GAME.hands['shit_pkr_four_flush'].level})
            delay(1.3)
    end,
    can_use = function(self, card)
        return true
    end
}
