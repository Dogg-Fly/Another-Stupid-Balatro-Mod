SMODS.Blind{
    key = 'the_shield',
    loc_txt = {
        name = 'The Shield',
        text = {
            "All Aces are debuffed"
        }
    },
    atlas = 'death',
    pos = { x = 0, y = 1 },
    dollars = 8,
    mult = 2,
    boss = { min = 3, max = 10 }, 
    boss_colour = HEX('8B4513'), 
    
    recalc_debuff = function(self, card, from_blind)
        local is_base_ace = card.base and card.base.value == 'Ace'
        
        local is_modified_ace = card:get_id() == 14
        
        return is_base_ace or is_modified_ace
    end,
    
    in_pool = function(self)
        return G.GAME.round_resets.ante >= 3
    end
}

SMODS.Blind{
    key = 'afforestation',
    loc_txt = {
        name = 'Afforestation',
        text = {
            "Face cards held in hand have",
            "a 1 in 3 chance to be destroyed",
            "when a hand is played"
        }
    },
    atlas = 'death',
    pos = { x = 0, y = 3 },
    dollars = 12,
    mult = 2.2,
    boss = { min = 5, max = 10 },
    boss_colour = HEX('8B0000'), 
    press_play = function(self)
        if G.hand and G.hand.cards then
            local cards_to_destroy = {}
            
            for i = 1, #G.hand.cards do
                local card = G.hand.cards[i]
                if card and card.base and card.base.value then
                    local rank = card.base.value
                    if rank == 'Jack' or rank == 'Queen' or rank == 'King' then
                        local destroy_chance = pseudorandom('afforestation', 1, 3)
                        if destroy_chance == 1 then
                            table.insert(cards_to_destroy, card)
                        end
                    end
                end
            end
            
            for _, card in ipairs(cards_to_destroy) do
                if card and not card.destroyed then
                    card.destroyed = true
                    G.hand:remove_card(card)
                    card:remove()
                    
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1,
                        func = function()
                            return true
                        end
                    }))
                end
            end
            
            if #cards_to_destroy > 0 and G.hand.align_cards then
                G.hand:align_cards()
            end
        end
    end,
    
    in_pool = function(self)
        return G.GAME.round_resets.ante >= 5
    end
}

local function get_required_cards_for_hand(handname)
    if G.handlist then
        for _, hand_key in ipairs(G.handlist) do
            local hand_data = G.GAME.hands[hand_key]
            if hand_data and localize(hand_key, 'poker_hands') == handname then
                for k, v in pairs(SMODS.PokerHands) do
                    if v.key == hand_key:gsub("^shit_pkr_", "") then
                        if v.example then
                            local count = 0
                            for _, card_example in ipairs(v.example) do
                                if card_example[2] == true then
                                    count = count + 1
                                end
                            end
                            if count > 0 then
                                return count
                            end
                        end
                        break
                    end
                end
            end
        end
    end
    
    if handname == "High Card" then return 1
    elseif handname == "Pair" then return 2
    elseif handname == "Two Pair" then return 4
    elseif handname == "Three of a Kind" then return 3
    elseif handname == "Straight" then return 5
    elseif handname == "Flush" then return 5
    elseif handname == "Full House" then return 5
    elseif handname == "Four of a Kind" then return 4
    elseif handname == "Straight Flush" then return 5
    elseif handname == "Five of a Kind" then return 5
    elseif handname == "Flush House" then return 5
    elseif handname == "Flush Five" then return 5
    elseif handname == "Four Flush" then return 4
    elseif handname == "Flor de Anchos" then return 3
    elseif handname == "Flor" then return 6
    elseif handname == "Flor de Tres" then return 3
    elseif handname == "Envido of 33" then return 3
    elseif handname == "Envido of 31" then return 3
    elseif handname == "Pieza" then return 3
    elseif handname == "Tanto" then return 2
    elseif handname == "Parda" then return 2
    end
    
    return 5
end

SMODS.Blind{
    key = 'the_perfectionist',
    loc_txt = {
        name = 'The Perfectionist',
        text = {
            "You can only play the exact",
            "number of cards required for the hand"
        }
    },
    atlas = 'death',
    pos = { x = 0, y = 0 },
    dollars = 12,
    mult = 2.8,
    boss = { min = 1, max = 10 },
    boss_colour = HEX('8A2BE2'),
    
    debuff_hand = function(self, cards, hand, handname, check)
        if not cards or not handname then return false end
        
        local required_cards = get_required_cards_for_hand(handname)
        
        if G.SETTINGS and G.SETTINGS.GAME and G.SETTINGS.GAME.debug then
            print("Perfectionist check: " .. handname .. " requires " .. required_cards .. " cards, played " .. #cards)
        end
        
        return #cards ~= required_cards
    end,
    
    in_pool = function(self)
        return G.GAME.round_resets.ante >= 4
    end
}

SMODS.Blind{
    key = 'huevo_eterno',
    loc_txt = {
        name = 'HUEVITOS',
        text = {
            "Each hand played creates",
            "an eternal Egg joker"
        }
    },
    atlas = 'death',
    pos = { x = 0, y = 4 },
    dollars = 10,
    mult = 2.5,
    boss_colour = HEX('2A8B53'),
    boss = { min = 8, max = 10 },

    
    press_play = function(self)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                local egg_joker = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_egg', nil)
                
                egg_joker.ability.eternal = true
                
                egg_joker:add_to_deck()
                G.jokers:emplace(egg_joker)
                egg_joker:start_materialize()
                
                return true
            end
        }))
    end,
    
    in_pool = function(self)
        return G.GAME.round_resets.ante >= 4
    end,
    
    collection_loc_vars = function(self)
        return {
            vars = {
                self.mult,
                self.dollars
            }
        }
    end
}

SMODS.Blind{
    key = 'perfect_run',
    loc_txt = {
        name = 'Perfect Run',
        text = {
            'All cards are flipped face down',
            'Only 1 hand and 0 discards',
            'Hand size reduced to 4'
        }
    },
    atlas = 'death',
    pos = { x = 0, y = 6 },
    dollars = 30,
    mult = 4,
    boss = { 
        min = 32, 
        max = 50 
    },
    boss_colour = HEX('FFD700'),
    
    set_blind = function(self, blind, reset, silent)
        self.perfect_original_hands = G.GAME.current_round.hands_left
        self.perfect_original_discards = G.GAME.current_round.discards_left
        self.perfect_original_hand_size = G.hand.config.card_limit
        self.perfect_flipped_hand_cards = {}
        self.perfect_flipped_deck_cards = {}
        
        G.GAME.current_round.hands_left = 1
        G.GAME.current_round.discards_left = 0
        G.hand.config.card_limit = 4
        
        if G.hand and G.hand.cards then
            for i = 1, #G.hand.cards do
                local card = G.hand.cards[i]
                if card and card.facing == 'front' then
                    self.perfect_flipped_hand_cards[card] = true
                    card.facing = 'back'
                    if card.children and card.children.center then
                        card.children.center.facing = 'back'
                    end
                    if card.flip then
                        card:flip()
                    end
                end
            end
        end
        
        if G.deck and G.deck.cards then
            for i = 1, #G.deck.cards do
                local card = G.deck.cards[i]
                if card and card.facing == 'front' then
                    self.perfect_flipped_deck_cards[card] = true
                    card.facing = 'back'
                    if card.children and card.children.center then
                        card.children.center.facing = 'back'
                    end
                    if card.flip then
                        card:flip()
                    end
                end
            end
        end
        
        if G.hand and G.hand.cards and #G.hand.cards > 4 then
            local cards_to_discard = {}
            for i = 5, #G.hand.cards do
                table.insert(cards_to_discard, G.hand.cards[i])
            end
            
            for _, card in ipairs(cards_to_discard) do
                G.hand:remove_card(card)
                G.discard:emplace(card)
            end
            
            if G.hand.align_cards then
                G.hand:align_cards()
            end
        end
    end,
    
    disable = function(self)
        if self.perfect_flipped_hand_cards then
            for card, _ in pairs(self.perfect_flipped_hand_cards) do
                if card and card.facing == 'back' then
                    card.facing = 'front'
                    if card.children and card.children.center then
                        card.children.center.facing = 'front'
                    end
                    if card.flip then
                        card:flip()
                    end
                end
            end
        end
        
        if self.perfect_flipped_deck_cards then
            for card, _ in pairs(self.perfect_flipped_deck_cards) do
                if card and card.facing == 'back' then
                    card.facing = 'front'
                    if card.children and card.children.center then
                        card.children.center.facing = 'front'
                    end
                    if card.flip then
                        card:flip()
                    end
                end
            end
        end
        
        if self.perfect_original_hands then
            G.GAME.current_round.hands_left = self.perfect_original_hands
        end
        if self.perfect_original_discards then
            G.GAME.current_round.discards_left = self.perfect_original_discards
        end
        if self.perfect_original_hand_size then
            G.hand.config.card_limit = self.perfect_original_hand_size
        end
        
        self.perfect_flipped_hand_cards = nil
        self.perfect_flipped_deck_cards = nil
        self.perfect_original_hands = nil
        self.perfect_original_discards = nil
        self.perfect_original_hand_size = nil
    end,
    
    defeat = function(self)
        self:disable()
    end,
    
    stay_flipped = function(self, area, card)
        return true
    end,
    
    drawn_to_hand = function(self)
        if G.hand and G.hand.cards then
            for i = 1, #G.hand.cards do
                local card = G.hand.cards[i]
                if card and card.facing == 'front' and not self.perfect_flipped_hand_cards[card] then
                    self.perfect_flipped_hand_cards[card] = true
                    card.facing = 'back'
                    if card.children and card.children.center then
                        card.children.center.facing = 'back'
                    end
                    if card.flip then
                        card:flip()
                    end
                end
            end
        end
    end,
    
    in_pool = function(self)
        return G.GAME.round_resets.ante >= 32
    end
}

SMODS.Blind{
    key = 'death',
    loc_txt = {
        name = 'Death',
        text = {
            "All cards are flipped face down",
            "Only 1 hand and 2 discards",
            "lol"
        }
    },
    atlas = 'death',
    pos = { x = 0, y = 2 },
    dollars = 15,
    mult = 3,
    boss = { 
        min = 1, 
        max = 10,
        showdown = true 
    },
    boss_colour = HEX('2C1810'), 
    
    set_blind = function(self, blind, reset, silent)
        self.death_original_hands = G.GAME.current_round.hands_left
        self.death_original_discards = G.GAME.current_round.discards_left
        self.death_flipped_jokers = {}
        self.death_flipped_hand_cards = {}
        self.death_flipped_deck_cards = {}
        
        G.GAME.current_round.hands_left = 1
        G.GAME.current_round.discards_left = 2
        
        if G.jokers and G.jokers.cards then
            for i = 1, #G.jokers.cards do
                local joker = G.jokers.cards[i]
                if joker and joker.facing == 'front' then
                    self.death_flipped_jokers[joker] = true
                    joker.facing = 'back'
                    if joker.children and joker.children.center then
                        joker.children.center.facing = 'back'
                    end
                    if joker.flip then
                        joker:flip()
                    end
                end
            end
        end
        
        if G.hand and G.hand.cards then
            for i = 1, #G.hand.cards do
                local card = G.hand.cards[i]
                if card and card.facing == 'front' then
                    self.death_flipped_hand_cards[card] = true
                    card.facing = 'back'
                    if card.children and card.children.center then
                        card.children.center.facing = 'back'
                    end
                    if card.flip then
                        card:flip()
                    end
                end
            end
        end
        
        if G.deck and G.deck.cards then
            for i = 1, #G.deck.cards do
                local card = G.deck.cards[i]
                if card and card.facing == 'front' then
                    self.death_flipped_deck_cards[card] = true
                    card.facing = 'back'
                    if card.children and card.children.center then
                        card.children.center.facing = 'back'
                    end
                    if card.flip then
                        card:flip()
                    end
                end
            end
        end
        
        if G.discard and G.discard.cards then
            for i = 1, #G.discard.cards do
                local card = G.discard.cards[i]
                if card and card.facing == 'front' then
                    self.death_flipped_deck_cards[card] = true
                    card.facing = 'back'
                    if card.children and card.children.center then
                        card.children.center.facing = 'back'
                    end
                    if card.flip then
                        card:flip()
                    end
                end
            end
        end
        
        if G.jokers and G.jokers.cards and #G.jokers.cards > 1 then
            local joker_refs = {}
            for i = 1, #G.jokers.cards do
                table.insert(joker_refs, G.jokers.cards[i])
            end
            
            for i = #joker_refs, 2, -1 do
                local j = pseudorandom('death_shuffle', 1, i)
                if j and j >= 1 and j <= #joker_refs then
                    joker_refs[i], joker_refs[j] = joker_refs[j], joker_refs[i]
                end
            end
            
            for i = 1, #joker_refs do
                G.jokers.cards[i] = joker_refs[i]
            end
            
            if G.jokers.align_cards then
                G.jokers:align_cards()
            end
        end
        
    end,
    
    disable = function(self)
        if self.death_flipped_jokers then
            for joker, _ in pairs(self.death_flipped_jokers) do
                if joker and joker.facing == 'back' then
                    joker.facing = 'front'
                    if joker.children and joker.children.center then
                        joker.children.center.facing = 'front'
                    end
                    if joker.flip then
                        joker:flip()
                    end
                end
            end
        end
        
        if self.death_flipped_hand_cards then
            for card, _ in pairs(self.death_flipped_hand_cards) do
                if card and card.facing == 'back' then
                    card.facing = 'front'
                    if card.children and card.children.center then
                        card.children.center.facing = 'front'
                    end
                    if card.flip then
                        card:flip()
                    end
                end
            end
        end
        
        if self.death_flipped_deck_cards then
            for card, _ in pairs(self.death_flipped_deck_cards) do
                if card and card.facing == 'back' then
                    card.facing = 'front'
                    if card.children and card.children.center then
                        card.children.center.facing = 'front'
                    end
                    if card.flip then
                        card:flip()
                    end
                end
            end
        end
        
        if self.death_original_hands then
            G.GAME.current_round.hands_left = self.death_original_hands
        end
        if self.death_original_discards then
            G.GAME.current_round.discards_left = self.death_original_discards
        end
        
        self.death_flipped_jokers = nil
        self.death_flipped_hand_cards = nil
        self.death_flipped_deck_cards = nil
        self.death_original_hands = nil
        self.death_original_discards = nil
    end,
    
    defeat = function(self)
        self:disable()
    end,
    
    stay_flipped = function(self, area, card)
        return true
    end,
    
    drawn_to_hand = function(self)
        if G.hand and G.hand.cards then
            for i = 1, #G.hand.cards do
                local card = G.hand.cards[i]
                if card and card.facing == 'front' and not self.death_flipped_hand_cards[card] then
                    self.death_flipped_hand_cards[card] = true
                    card.facing = 'back'
                    if card.children and card.children.center then
                        card.children.center.facing = 'back'
                    end
                    if card.flip then
                        card:flip()
                    end
                end
            end
        end
    end,
    
    in_pool = function(self)
        return G.GAME.round_resets.ante >= 8
    end,
    
    collection_loc_vars = function(self)
        return {
            vars = {
                self.mult,
                self.dollars
            }
        }
    end
}

--estas fueron las blinds que mas me costaron hacer 

local lost_silver_words = {
    "ABANDONED", "AGONY", "BOO", "CANYOUSEE", "CELEBIDIED",
    "DONTBELONG", "DYING", "EERIENOISE", "FRUSTRATION", "GETOUT",
    "GOLD", "GOODBYE", "GRUESOME", "HEDIED", "HELP",
    "HOPELESS", "IMDEAD", "ISEEYOU", "ITFAILED", "LEAVEHURRY",
    "NIGHTMARE", "NOTWANTED", "NOTWELCOME", "PERISHSONG", "RUN",
    "RELIVE", "SILVER", "TIRESOME", "USELESS", "WHERE",
    "XXXXX", "NOMORE"
}

G.LOST_SILVER_STATE = {
    active = false,
    timer = 0,
    word_timer = 8,
    current_word = nil,
    typed_letters = {},
    overlay_alpha = 0,
    challenge_start_time = 0,
    pause_time = 0,
    max_time = 10,
    is_blind_active = false
}

SMODS.Blind {
    key = "lost_silver",
    loc_txt = {
        name = "LOST SILVER",
        text = {
            "Every 8 seconds you must",
            "complete a word",
            "or lose hands"
        }
    },
    boss = {min = 1, max = 10},
    boss_colour = HEX("8B0000"),
    atlas = "death",
    pos = {x = 0, y = 7},
    dollars = 8,
    mult = 2,
    vars = {},
    debuff = {},
    
    in_pool = function(self)
        return true
    end,
    
    set_blind = function(self, reset, silent)
        if not reset then
            G.LOST_SILVER_STATE.is_blind_active = true
            G.LOST_SILVER_STATE.active = false
            G.LOST_SILVER_STATE.timer = 0
            G.LOST_SILVER_STATE.current_word = nil
            G.LOST_SILVER_STATE.typed_letters = {}
            G.LOST_SILVER_STATE.overlay_alpha = 0
            G.LOST_SILVER_STATE.pause_time = 0
        end
    end,
    
    disable = function(self)
        G.LOST_SILVER_STATE.is_blind_active = false
        G.LOST_SILVER_STATE.active = false
        G.LOST_SILVER_STATE.current_word = nil
        G.LOST_SILVER_STATE.typed_letters = {}
        G.LOST_SILVER_STATE.overlay_alpha = 0
        if G.CONTROLLER then
            G.CONTROLLER.locked = false
        end
    end,
    
    defeat = function(self)
        G.LOST_SILVER_STATE.is_blind_active = false
        G.LOST_SILVER_STATE.active = false
        G.LOST_SILVER_STATE.current_word = nil
        G.LOST_SILVER_STATE.typed_letters = {}
        G.LOST_SILVER_STATE.overlay_alpha = 0
        if G.CONTROLLER then
            G.CONTROLLER.locked = false
        end
    end
}

local game_update_ref = Game.update
function Game:update(dt)
    game_update_ref(self, dt)
    
    if not G.LOST_SILVER_STATE or not G.LOST_SILVER_STATE.is_blind_active then 
        return 
    end
    
    local valid_states = G.STATE == G.STATES.SELECTING_HAND or 
                        G.STATE == G.STATES.DRAW_TO_HAND or
                        G.STATE == G.STATES.HAND_PLAYED
    
    local in_menu = G.STATE == G.STATES.MENU or 
                   G.STATE == G.STATES.OPTIONS or
                   G.STATE == G.STATES.SPLASH
    
    local in_overlay = G.OVERLAY_MENU ~= nil
    
    if not valid_states or in_menu or in_overlay then 
        if G.LOST_SILVER_STATE.active then
            G.LOST_SILVER_STATE.pause_time = G.LOST_SILVER_STATE.pause_time + dt
        end
        return 
    end
    
    if not G.LOST_SILVER_STATE.active then
        G.LOST_SILVER_STATE.timer = G.LOST_SILVER_STATE.timer + dt
        
        if G.LOST_SILVER_STATE.timer >= G.LOST_SILVER_STATE.word_timer then
            G.LOST_SILVER_STATE.timer = 0
            G.LOST_SILVER_STATE.active = true
            
            local new_word = lost_silver_words[math.random(#lost_silver_words)]
            while new_word == G.LOST_SILVER_STATE.current_word and #lost_silver_words > 1 do
                new_word = lost_silver_words[math.random(#lost_silver_words)]
            end
            G.LOST_SILVER_STATE.current_word = new_word
            
            G.LOST_SILVER_STATE.typed_letters = {}
            G.LOST_SILVER_STATE.overlay_alpha = 0
            G.LOST_SILVER_STATE.challenge_start_time = love.timer.getTime()
            G.LOST_SILVER_STATE.pause_time = 0
            if G.CONTROLLER then
                G.CONTROLLER.locked = true
            end
            
            if G.SOUND_MANAGER then
                play_sound('tarot2', 0.8, 0.4)
            end
        end
    else
        local elapsed = (love.timer.getTime() - G.LOST_SILVER_STATE.challenge_start_time) - G.LOST_SILVER_STATE.pause_time
        if elapsed >= G.LOST_SILVER_STATE.max_time then
            G.LOST_SILVER_STATE.active = false
            if G.CONTROLLER then
                G.CONTROLLER.locked = false
            end
            
            ease_hands_played(-1)
            G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
            
            if G.GAME.round_resets.hands <= 0 then
                G.STATE = G.STATES.GAME_OVER
                G.STATE_COMPLETE = false
            end
            
            if G.SOUND_MANAGER then
                play_sound('tarot1', 0.8, 0.3)
            end
        end
        
        if G.LOST_SILVER_STATE.overlay_alpha < 0.7 then
            G.LOST_SILVER_STATE.overlay_alpha = math.min(0.7, G.LOST_SILVER_STATE.overlay_alpha + dt * 2)
        end
    end
end

local function check_word_complete()
    if #G.LOST_SILVER_STATE.typed_letters ~= #G.LOST_SILVER_STATE.current_word then
        return false
    end
    
    for i = 1, #G.LOST_SILVER_STATE.typed_letters do
        local expected = G.LOST_SILVER_STATE.current_word:sub(i, i)
        if G.LOST_SILVER_STATE.typed_letters[i].letter ~= expected then
            return false
        end
    end
    
    return true
end

local old_textinput = love.textinput or function() end
love.textinput = function(text)
    if G.LOST_SILVER_STATE and G.LOST_SILVER_STATE.is_blind_active and G.LOST_SILVER_STATE.active and G.LOST_SILVER_STATE.current_word then
        local letter = text:upper()
        
        if letter:match("^[A-Z]$") and #G.LOST_SILVER_STATE.typed_letters < #G.LOST_SILVER_STATE.current_word then
            local position = #G.LOST_SILVER_STATE.typed_letters + 1
            local expected_letter = G.LOST_SILVER_STATE.current_word:sub(position, position)
            local is_correct = (letter == expected_letter)
            
            table.insert(G.LOST_SILVER_STATE.typed_letters, {
                letter = letter,
                correct = is_correct
            })
            
            if G.SOUND_MANAGER then
                if is_correct then
                    play_sound('card1', 1, 0.5)
                else
                    play_sound('button', 0.8, 0.3)
                end
            end
            
            if check_word_complete() then
                G.LOST_SILVER_STATE.active = false
                if G.CONTROLLER then
                    G.CONTROLLER.locked = false
                end
                if G.SOUND_MANAGER then
                    play_sound('generic1', 1.2, 0.6)
                end
            end
        end
    end
    
    old_textinput(text)
end

local old_keypressed = love.keypressed or function() end
love.keypressed = function(key)
    if G.LOST_SILVER_STATE and G.LOST_SILVER_STATE.is_blind_active and G.LOST_SILVER_STATE.active then
        if key == "backspace" or key == "delete" then
            if #G.LOST_SILVER_STATE.typed_letters > 0 then
                table.remove(G.LOST_SILVER_STATE.typed_letters)
                
                if G.SOUND_MANAGER then
                    play_sound('button', 0.6, 0.4)
                end
            end
        end
    end
    
    old_keypressed(key)
end

local love_draw_ref = love.draw
love.draw = function()
    love_draw_ref()
    
    if not G.LOST_SILVER_STATE or not G.LOST_SILVER_STATE.is_blind_active or not G.LOST_SILVER_STATE.active or not G.LOST_SILVER_STATE.current_word then
        return
    end
    
    local in_menu = G.STATE == G.STATES.MENU or 
                   G.STATE == G.STATES.OPTIONS or
                   G.STATE == G.STATES.SPLASH
    
    local in_overlay = G.OVERLAY_MENU ~= nil
    
    if in_menu or in_overlay then
        return
    end
    
    local original_font = love.graphics.getFont()
    
    local screen_w = love.graphics.getWidth()
    local screen_h = love.graphics.getHeight()
    
    love.graphics.setColor(0.8, 0, 0, G.LOST_SILVER_STATE.overlay_alpha)
    love.graphics.rectangle('fill', 0, 0, screen_w, screen_h)
    
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf(G.LOST_SILVER_STATE.current_word, 0, screen_h * 0.3, screen_w, 'center')
    
    local underscore_y = screen_h * 0.65
    local spacing = 70
    local total_width = #G.LOST_SILVER_STATE.current_word * spacing
    local start_x = (screen_w / 2) - (total_width / 2)
    
    for i = 1, #G.LOST_SILVER_STATE.current_word do
        local letter_x = start_x + (i - 1) * spacing
        
        if i <= #G.LOST_SILVER_STATE.typed_letters then
            local letter_info = G.LOST_SILVER_STATE.typed_letters[i]
            if letter_info.correct then
                love.graphics.setColor(0.2, 1, 0.2, 1)
            else
                love.graphics.setColor(1, 0.2, 0.2, 1)
            end
            love.graphics.printf(letter_info.letter, letter_x - 35, underscore_y - 15, 70, 'center')
        else
            love.graphics.setColor(1, 1, 1, 0.8)
            love.graphics.printf("_", letter_x - 35, underscore_y, 70, 'center')
        end
    end
    
    local elapsed = (love.timer.getTime() - G.LOST_SILVER_STATE.challenge_start_time) - G.LOST_SILVER_STATE.pause_time
    local time_left = math.max(0, G.LOST_SILVER_STATE.max_time - elapsed)
    local time_text = string.format("%.1f", time_left)
    
    local text_width = original_font:getWidth(time_text)
    local box_width = text_width + 40
    local box_height = 60
    local box_x = (screen_w / 2) - (box_width / 2)
    local box_y = screen_h - 100
    
    love.graphics.setColor(0, 0, 0, 0.5)
    love.graphics.rectangle('fill', box_x, box_y, box_width, box_height)
    
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf(time_text, box_x, box_y + 15, box_width, 'center')
    
    love.graphics.setFont(original_font)
    love.graphics.setColor(1, 1, 1, 1)
end

G.CAPTCHA_STATE = {
    active = false,
    timer = 0,
    check_interval = 3,
    blocked = false,
    captcha_cards = {},
    correct_indices = {},
    selected_indices = {},
    boxes = {},
    target_card = nil
}

local function get_random_cards()
    local cards = {}
    local card_pool = {
        jokers = {},
        tarots = {},
        planets = {},
        spectrals = {},
        vouchers = {}
    }
    
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Joker' then
            table.insert(card_pool.jokers, k)
        elseif v.set == 'Tarot' then
            table.insert(card_pool.tarots, k)
        elseif v.set == 'Planet' then
            table.insert(card_pool.planets, k)
        elseif v.set == 'Spectral' then
            table.insert(card_pool.spectrals, k)
        elseif v.set == 'Voucher' then
            table.insert(card_pool.vouchers, k)
        end
    end
    
    local all_types = {}
    if #card_pool.jokers > 0 then table.insert(all_types, 'jokers') end
    if #card_pool.tarots > 0 then table.insert(all_types, 'tarots') end
    if #card_pool.planets > 0 then table.insert(all_types, 'planets') end
    if #card_pool.spectrals > 0 then table.insert(all_types, 'spectrals') end
    if #card_pool.vouchers > 0 then table.insert(all_types, 'vouchers') end
    
    if #all_types == 0 then
        for i = 1, 9 do
            cards[i] = 'j_joker'
        end
        return cards, 'j_joker'
    end
    
    local chosen_type = 'jokers'
    local pool = card_pool[chosen_type]
    
    if #pool == 0 then
        for i = 1, 9 do
            cards[i] = 'j_joker'
        end
        return cards, 'j_joker'
    end
    
    local target_card = pool[math.random(#pool)]
    
    cards[1] = target_card
    cards[2] = target_card
    
    for i = 3, 9 do
        local rand_type = all_types[math.random(#all_types)]
        local rand_pool = card_pool[rand_type]
        if #rand_pool > 0 then
            cards[i] = rand_pool[math.random(#rand_pool)]
        else
            cards[i] = target_card
        end
    end
    
    for i = #cards, 2, -1 do
        local j = math.random(i)
        cards[i], cards[j] = cards[j], cards[i]
    end
    
    return cards, target_card
end

local function CheckCollision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1
end

local function create_captcha_ui()
    local cards, target = get_random_cards()
    G.CAPTCHA_STATE.captcha_cards = cards
    G.CAPTCHA_STATE.target_card = target
    G.CAPTCHA_STATE.selected_indices = {}
    G.CAPTCHA_STATE.correct_indices = {}
    G.CAPTCHA_STATE.boxes = {}
    
    if G.hand and G.hand.cards then
        for i = #G.hand.highlighted, 1, -1 do
            local card = G.hand.highlighted[i]
            card.highlighted = false
            G.hand.highlighted[i] = nil
        end
        
        for k, card in ipairs(G.hand.cards) do
            if card.highlighted then
                card.highlighted = false
            end
            if card.area and card.area == G.hand then
                card:highlight(false)
            end
        end
        
        G.hand.highlighted = {}
    end
    
    for i, card_key in ipairs(G.CAPTCHA_STATE.captcha_cards) do
        if card_key == target then
            table.insert(G.CAPTCHA_STATE.correct_indices, i)
        end
    end
end

local function verify_captcha()
    if #G.CAPTCHA_STATE.selected_indices ~= 2 then return false end
    
    for _, correct_idx in ipairs(G.CAPTCHA_STATE.correct_indices) do
        local found = false
        for _, selected_idx in ipairs(G.CAPTCHA_STATE.selected_indices) do
            if selected_idx == correct_idx then
                found = true
                break
            end
        end
        if not found then return false end
    end
    
    return true
end

local function clear_captcha()
    G.CAPTCHA_STATE.blocked = false
    G.CAPTCHA_STATE.timer = 0
    G.CAPTCHA_STATE.boxes = {}
    G.CAPTCHA_STATE.selected_indices = {}
    G.CAPTCHA_STATE.captcha_cards = {}
    G.CAPTCHA_STATE.correct_indices = {}
    G.CAPTCHA_STATE.target_card = nil
    
    if G.hand and G.hand.cards then
        for k, card in ipairs(G.hand.cards) do
            if card.ability and card.ability.effect then
                card.ability.effect = 'Base'
            end
        end
    end
end

SMODS.Blind {
    key = 'captcha',
    loc_txt = {
        name = 'CAPTCHA',
        text = {
            'Must verify you are human',
            'every 3 seconds'
        }
    },
    boss = {min = 1, max = 10},
    boss_colour = HEX('3B82F6'),
    atlas = "death",
    pos = {x = 0, y = 5},
    dollars = 5,
    mult = 2,
    discovered = false,
    
    set_blind = function(self, reset, silent)
        if not reset then
            G.CAPTCHA_STATE.active = true
            G.CAPTCHA_STATE.timer = 0
            G.CAPTCHA_STATE.blocked = false
        end
    end,
    
    disable = function(self)
        G.CAPTCHA_STATE.active = false
        clear_captcha()
    end,
    
    defeat = function(self)
        G.CAPTCHA_STATE.active = false
        clear_captcha()
    end
}

local game_updateref = Game.update
Game.update = function(self, dt)
    game_updateref(self, dt)
    
    if G.CAPTCHA_STATE.active and not G.CAPTCHA_STATE.blocked and G.STATE == G.STATES.SELECTING_HAND then
        G.CAPTCHA_STATE.timer = G.CAPTCHA_STATE.timer + dt
        if G.CAPTCHA_STATE.timer >= G.CAPTCHA_STATE.check_interval then
            G.CAPTCHA_STATE.blocked = true
            create_captcha_ui()
        end
    end
end

local game_draw_ref = Game.draw
Game.draw = function(self)
    game_draw_ref(self)
    
    if G.CAPTCHA_STATE.blocked and #G.CAPTCHA_STATE.captcha_cards > 0 then
        local old_font = love.graphics.getFont()
        
        love.graphics.push('all')
        love.graphics.reset()
        love.graphics.setShader()
        
        local screen_w = love.graphics.getWidth()
        local screen_h = love.graphics.getHeight()
        
        love.graphics.setColor(0, 0, 0, 0.85)
        love.graphics.rectangle("fill", 0, 0, screen_w, screen_h)
        

        local center_x = screen_w / 2 + 70
        local center_y = screen_h / 2
        
        local panel_w = 520
        local panel_h = 450
        
        love.graphics.setColor(0.28, 0.33, 0.41, 1)
        love.graphics.rectangle("fill", center_x - panel_w/2, center_y - panel_h/2, panel_w, panel_h, 15)
        
        love.graphics.setColor(0.35, 0.4, 0.48, 1)
        love.graphics.setLineWidth(3)
        love.graphics.rectangle("line", center_x - panel_w/2, center_y - panel_h/2, panel_w, panel_h, 15)
        
        if old_font then love.graphics.setFont(old_font) end
        love.graphics.setColor(1, 1, 1, 1)
        

        local text_start = center_x - panel_w/2
        love.graphics.printf("Verify you are human", text_start, center_y - 185, panel_w, "center")
        
        local target_name = "the target"
        if G.CAPTCHA_STATE.target_card then
            local card_info = G.P_CENTERS[G.CAPTCHA_STATE.target_card]
            if card_info then

                local localized = localize({type = 'name_text', key = G.CAPTCHA_STATE.target_card, set = card_info.set or 'Joker'})
                if localized and localized ~= G.CAPTCHA_STATE.target_card then
                    target_name = localized
                elseif card_info.loc_txt and type(card_info.loc_txt) == 'table' and card_info.loc_txt.name then
                    target_name = card_info.loc_txt.name
                elseif card_info.key and G.localization and G.localization.descriptions and G.localization.descriptions.Joker then
                    local loc_data = G.localization.descriptions.Joker[card_info.key]
                    if loc_data and loc_data.name then
                        target_name = loc_data.name
                    end
                end
            end
        end
        love.graphics.printf("Select the 2 images that show: " .. target_name, text_start, center_y - 160, panel_w, "center")
        

        local start_x = center_x - 121
        local start_y = center_y - 70
        local spacing = 110
        
        for row = 0, 2 do
            for col = 0, 2 do
                local index = row * 3 + col + 1
                local card_key = G.CAPTCHA_STATE.captcha_cards[index]
                
                if card_key then
                    local x = start_x + (col * spacing)
                    local y = start_y + (row * spacing)
                    
                    local hitbox_w = 100
                    local hitbox_h = 120
                    
                    if not G.CAPTCHA_STATE.boxes[index] then
                        G.CAPTCHA_STATE.boxes[index] = {}
                    end
                    G.CAPTCHA_STATE.boxes[index].screen_x = x
                    G.CAPTCHA_STATE.boxes[index].screen_y = y
                    G.CAPTCHA_STATE.boxes[index].screen_width = hitbox_w
                    G.CAPTCHA_STATE.boxes[index].screen_height = hitbox_h
                    
                    local is_selected = false
                    for _, selected in ipairs(G.CAPTCHA_STATE.selected_indices) do
                        if selected == index then
                            is_selected = true
                            break
                        end
                    end
                    
                    if is_selected then
                        love.graphics.setColor(0, 0, 0, 0.3)
                        love.graphics.rectangle("fill", x - hitbox_w/2 + 3, y - hitbox_h/2 + 3, hitbox_w, hitbox_h, 8)
                        
                        love.graphics.setColor(0.23, 0.51, 0.96, 1)
                    else
                        love.graphics.setColor(0, 0, 0, 0.3)
                        love.graphics.rectangle("fill", x - hitbox_w/2 + 3, y - hitbox_h/2 + 3, hitbox_w, hitbox_h, 8)
                        
                        love.graphics.setColor(0.2, 0.2, 0.25, 1)
                    end
                    love.graphics.rectangle("fill", x - hitbox_w/2, y - hitbox_h/2, hitbox_w, hitbox_h, 8)
                    
                    if is_selected then
                        love.graphics.setColor(0.3, 0.6, 1, 1)
                        love.graphics.setLineWidth(3)
                    else
                        love.graphics.setColor(0.35, 0.35, 0.4, 1)
                        love.graphics.setLineWidth(2)
                    end
                    love.graphics.rectangle("line", x - hitbox_w/2, y - hitbox_h/2, hitbox_w, hitbox_h, 8)
                    
                    local card_info = G.P_CENTERS[card_key]
                    if card_info then
                        local card_atlas = G.ASSET_ATLAS[card_info.atlas or 'Joker']
                        if card_atlas then
                            local card_img = card_atlas.image or card_atlas.texture
                            if card_img then
                                local pos = card_info.pos or {x = 0, y = 0}
                                local sprite_w = card_atlas.px or 71
                                local sprite_h = card_atlas.py or 95
                                
                                local quad = love.graphics.newQuad(
                                    pos.x * sprite_w,
                                    pos.y * sprite_h,
                                    sprite_w,
                                    sprite_h,
                                    card_img:getWidth(),
                                    card_img:getHeight()
                                )
                                
                                local scale = is_selected and 1.3 or 1.15
                                love.graphics.setColor(1, 1, 1, 1)
                                love.graphics.draw(card_img, quad, 
                                    x - (sprite_w * scale / 2), 
                                    y - (sprite_h * scale / 2), 
                                    0, scale, scale)
                            end
                        end
                    end
                end
            end
        end
        
        love.graphics.pop()
    end
end

local love_mousepressed_ref = love.mousepressed
love.mousepressed = function(x, y, button)
    if G.CAPTCHA_STATE.blocked and #G.CAPTCHA_STATE.boxes > 0 and button == 1 then
        for index, box in ipairs(G.CAPTCHA_STATE.boxes) do
            if box.screen_x and box.screen_y then
                local box_x = box.screen_x - box.screen_width/2
                local box_y = box.screen_y - box.screen_height/2
                
                if CheckCollision(box_x, box_y, box.screen_width, box.screen_height, x, y, 2, 2) then
                    local found_index = nil
                    for i, selected in ipairs(G.CAPTCHA_STATE.selected_indices) do
                        if selected == index then
                            found_index = i
                            break
                        end
                    end
                    
                    if found_index then
                        table.remove(G.CAPTCHA_STATE.selected_indices, found_index)
                        play_sound('button', 0.9, 0.3)
                    elseif #G.CAPTCHA_STATE.selected_indices < 2 then
                        table.insert(G.CAPTCHA_STATE.selected_indices, index)
                        play_sound('button', 1.1, 0.3)
                        
                        if #G.CAPTCHA_STATE.selected_indices == 2 then
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.3,
                                func = function()
                                    if verify_captcha() then
                                        clear_captcha()
                                        play_sound('generic1', 1, 0.4)
                                    else

                                        if G.GAME and G.GAME.current_round and G.GAME.current_round.discards_left and G.GAME.current_round.discards_left > 0 then
                                            ease_discard(-1)
                                        end
                                        play_sound('cancel', 1, 0.6)
                                        G.E_MANAGER:add_event(Event({
                                            trigger = 'after',
                                            delay = 0.5,
                                            func = function()
                                                create_captcha_ui()
                                                return true
                                            end
                                        }))
                                    end
                                    return true
                                end
                            }))
                        end
                    end
                    
                    return
                end
            end
        end
    end
    
    if love_mousepressed_ref then
        love_mousepressed_ref(x, y, button)
    end
end

local old_highlight = Card.highlight
Card.highlight = function(self, is_higlighted)
    if G.CAPTCHA_STATE and G.CAPTCHA_STATE.blocked then
        self.highlighted = false
        return
    end
    if old_highlight then
        return old_highlight(self, is_higlighted)
    end
end

local old_click_card = Card.click
Card.click = function(self)
    if G.CAPTCHA_STATE and G.CAPTCHA_STATE.blocked then
        play_sound('cancel', 1, 0.6)
        return
    end
    if old_click_card then
        return old_click_card(self)
    end
end

local old_can_select = Card.can_select_for_hand
Card.can_select_for_hand = function(self)
    if G.CAPTCHA_STATE and G.CAPTCHA_STATE.blocked then
        play_sound('cancel', 1, 0.6)
        return false
    end
    if old_can_select then
        return old_can_select(self)
    end
    return true
end

local old_can_play = Card.can_play_card
Card.can_play_card = function(self, any_state)
    if G.CAPTCHA_STATE and G.CAPTCHA_STATE.blocked then
        play_sound('cancel', 1, 0.6)
        return false
    end
    return old_can_play(self, any_state)
end

local old_can_discard = Card.can_discard
Card.can_discard = function(self)
    if G.CAPTCHA_STATE and G.CAPTCHA_STATE.blocked then
        play_sound('cancel', 1, 0.6)
        return false
    end
    if old_can_discard then
        return old_can_discard(self)
    end
    return true
end

local old_can_highlight = Card.can_highlight
Card.can_highlight = function(self)
    if G.CAPTCHA_STATE and G.CAPTCHA_STATE.blocked then
        return false
    end
    if old_can_highlight then
        return old_can_highlight(self)
    end
    return true
end

if G.FUNCS and G.FUNCS.play_cards_from_highlighted then
    local old_play_hand_button = G.FUNCS.play_cards_from_highlighted
    G.FUNCS.play_cards_from_highlighted = function(e)
        if G.CAPTCHA_STATE and G.CAPTCHA_STATE.blocked then
            play_sound('cancel', 1, 0.6)
            return
        end
        return old_play_hand_button(e)
    end
end

if G.FUNCS and G.FUNCS.discard_cards_from_highlighted then
    local old_discard_button = G.FUNCS.discard_cards_from_highlighted
    G.FUNCS.discard_cards_from_highlighted = function(e)
        if G.CAPTCHA_STATE and G.CAPTCHA_STATE.blocked then
            play_sound('cancel', 1, 0.6)
            return
        end
        if old_discard_button then
            return old_discard_button(e)
        end
    end
end
