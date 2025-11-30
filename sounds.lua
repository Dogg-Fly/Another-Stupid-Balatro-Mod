SMODS.Sound{
    key="balatro",
    path="balatro.ogg",
    pitch=1,
    volume=1
}

SMODS.Sound{
    key="food",
    path="food.ogg",
    pitch=1,
    volume=1
}

SMODS.Sound{
    key="taking",
    path="taking.ogg",
    pitch=1,
    volume=1
}

SMODS.Sound{
    key="dave",
    path="dave.ogg",
    pitch=1,
    volume=1
}

SMODS.Sound({
    key = "shitpost_music", 
    path = "shitpost_music.ogg",
    pitch = 0.7,
    sync = true,
    select_music_track = function()
        return (G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and 
                G.pack_cards.cards[1].ability.set == "Joker" and
                G.pack_cards.cards[1].config and G.pack_cards.cards[1].config.center and
                G.pack_cards.cards[1].config.center.rarity == "shit_shitpost") and 10 or false
    end
})

SMODS.Sound({
    key = "generic_music", 
    path = "generic_music.ogg",
    pitch = 0.7,
    sync = true,
    select_music_track = function()
        return (G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and 
                G.pack_cards.cards[1].ability.set == "generic") and 10 or false
    end
})

SMODS.Sound({
    key = "ultrarot_music", 
    path = "ultrarot_music.ogg",
    pitch = 0.7,
    sync = true,
    select_music_track = function()
        return (G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and 
                G.pack_cards.cards[1].ability.set == "ultrarot") and 10 or false
    end
})

SMODS.Sound {
    key = 'music_menutest',
    path = 'menutest.ogg', 
    volume = 0.6,
    pitch = 1.0,
    
    select_music_track = function(self)
        if config.enable_menu_music and (G.STATE == G.STATES.MENU or G.STATE == 11) then
            return 100  
        end
        return nil  
    end
}