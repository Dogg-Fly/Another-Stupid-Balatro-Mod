local active_ads = {}
local ad_sizes = {
    {w = 150, h = 100},
    {w = 100, h = 100},
    {w = 150, h = 150},
    {w = 250, h = 250},
    {w = 200, h = 150},
    {w = 250, h = 200},
    {w = 180, h = 120}
}

local ad_sprites = {}
local loaded_count = 0
for i = 1, 33 do
    local success, sprite = pcall(function()
        return love.graphics.newImage('Mods/anotherstupidbalatromod/assets/popups/pop' .. i .. '.png')
    end)
    if success and sprite then
        table.insert(ad_sprites, sprite)
        loaded_count = loaded_count + 1
    end
end

local ad_timer = 0
local ad_spawn_interval = 10

local used_sprites = {}

local function spawn_ad()
    if #ad_sprites == 0 then return end
    
    local available_sprites = {}
    for i, sprite in ipairs(ad_sprites) do
        if not used_sprites[i] or #used_sprites >= #ad_sprites then
            table.insert(available_sprites, {idx = i, sprite = sprite})
        end
    end
    
    if #available_sprites == 0 then
        used_sprites = {}
        for i, sprite in ipairs(ad_sprites) do
            table.insert(available_sprites, {idx = i, sprite = sprite})
        end
    end
    
    local size_idx = math.random(#ad_sizes)
    local size = ad_sizes[size_idx]
    
    local chosen = available_sprites[math.random(#available_sprites)]
    used_sprites[chosen.idx] = true
    
    local screen_w = love.graphics.getWidth()
    local screen_h = love.graphics.getHeight()
    
    local ad = {
        x = math.random(0, screen_w - size.w),
        y = math.random(0, screen_h - size.h),
        w = size.w,
        h = size.h,
        vx = 0,
        vy = 0,
        sprite = chosen.sprite,
        id = #active_ads + 1,
        alpha = 1.0,
        hover = false
    }
    table.insert(active_ads, ad)
    
    if G and G.SETTINGS and G.SETTINGS.SOUND then
        play_sound('highlight1', 1.2, 0.4)
    end
end

local function update_ads(dt)
    if not G or not G.STAGE or G.STAGE ~= G.STAGES.RUN then return end
    if not G.jokers or not G.jokers.cards then return end
    
    local has_adware = false
    for _, card in ipairs(G.jokers.cards) do
        if card.ability and card.ability.name == 'j_shit_adware' then
            has_adware = true
            break
        end
    end
    
    if not has_adware then
        active_ads = {}
        ad_timer = 0
        used_sprites = {}
        return
    end
    
    ad_timer = ad_timer + dt
    if ad_timer >= ad_spawn_interval then
        spawn_ad()
        ad_timer = 0
    end
    
    local mouse_x, mouse_y = love.mouse.getPosition()
    for _, ad in ipairs(active_ads) do
        ad.hover = (mouse_x >= ad.x + ad.w - 30 and mouse_x <= ad.x + ad.w and
                    mouse_y >= ad.y and mouse_y <= ad.y + 30)
    end
end

local function render_ads()
    if #active_ads == 0 then return end
    
    love.graphics.push()
    love.graphics.origin()
    
    for _, ad in ipairs(active_ads) do
        love.graphics.setColor(0, 0, 0, 0.3)
        love.graphics.rectangle('fill', ad.x + 5, ad.y + 5, ad.w, ad.h, 5, 5)
        
        love.graphics.setColor(1, 1, 1, ad.alpha * 0.95)
        if ad.sprite then
            love.graphics.draw(
                ad.sprite,
                ad.x, ad.y,
                0,
                ad.w / ad.sprite:getWidth(),
                ad.h / ad.sprite:getHeight()
            )
        else
            love.graphics.setColor(0.9, 0.9, 0.9, ad.alpha * 0.9)
            love.graphics.rectangle('fill', ad.x, ad.y, ad.w, ad.h, 5, 5)
            love.graphics.setColor(0.3, 0.3, 0.3, ad.alpha)
            love.graphics.printf('ADVERTISEMENT', ad.x, ad.y + ad.h/2 - 15, ad.w, 'center')
            love.graphics.printf('Click X to close', ad.x, ad.y + ad.h/2 + 5, ad.w, 'center')
        end
        
        love.graphics.setColor(0.2, 0.2, 0.2, ad.alpha)
        love.graphics.setLineWidth(2)
        love.graphics.rectangle('line', ad.x, ad.y, ad.w, ad.h, 5, 5)
        love.graphics.setLineWidth(1)
        
        local close_button_color = ad.hover and {1, 0.2, 0.2} or {0.9, 0.1, 0.1}
        love.graphics.setColor(close_button_color[1], close_button_color[2], close_button_color[3], ad.alpha * 0.95)
        love.graphics.rectangle('fill', ad.x + ad.w - 30, ad.y, 30, 30, 5, 5)
        
        love.graphics.setColor(1, 1, 1, ad.alpha)
        love.graphics.setLineWidth(3)
        love.graphics.line(ad.x + ad.w - 22, ad.y + 8, ad.x + ad.w - 8, ad.y + 22)
        love.graphics.line(ad.x + ad.w - 8, ad.y + 8, ad.x + ad.w - 22, ad.y + 22)
        love.graphics.setLineWidth(1)
        
        love.graphics.setColor(1, 1, 1, ad.alpha * 0.7)
        love.graphics.rectangle('fill', ad.x, ad.y + ad.h - 20, 40, 20, 0, 0, 5, 0)
        love.graphics.setColor(0, 0, 0, ad.alpha)
        love.graphics.printf('AD', ad.x, ad.y + ad.h - 17, 40, 'center')
    end
    
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.pop()
end

local function check_ad_click(x, y)
    for i = #active_ads, 1, -1 do
        local ad = active_ads[i]
        if x >= ad.x + ad.w - 30 and x <= ad.x + ad.w and
           y >= ad.y and y <= ad.y + 30 then
            table.remove(active_ads, i)
            if G and G.SETTINGS and G.SETTINGS.SOUND then
                play_sound('cancel', 1, 0.4)
            end
            return true
        end
    end
    return false
end

local old_game_update_ref = Game.update
function Game.update(self, dt)
    old_game_update_ref(self, dt)
    update_ads(dt)
end

local original_draw = love.draw
function love.draw()
    if original_draw then
        original_draw()
    end
    render_ads()
end

local original_mousepressed = love.mousepressed
function love.mousepressed(x, y, button)
    if button == 1 then
        if check_ad_click(x, y) then
            return
        end
    end
    if original_mousepressed then
        original_mousepressed(x, y, button)
    end
end

SMODS.Joker({
    key = 'adware',
    loc_txt = {
        name = 'Adware',
        text = {
            '{X:mult,C:white}X#1#{} Mult',
            'for each {C:attention}ad{}',
            'on screen',
            'Spawns {C:attention}annoying ads{}',
            'every {C:attention}#4#{} seconds',
            '{C:inactive}(Currently {C:attention}#2#{C:inactive} ads, {X:mult,C:white}X#3#{C:inactive})'
        }
    },
    config = {
        extra = {
            x_mult_per_ad = 0.5
        }
    },
    rarity = 2,
    pos = { x = 7, y = 18 },
    atlas = 'CustomJokers',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pools = { ["shit_shit_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        local ad_count = #active_ads
        local current_mult = 1 + (card.ability.extra.x_mult_per_ad * ad_count)
        return { vars = { 
            card.ability.extra.x_mult_per_ad,
            ad_count,
            current_mult,
            ad_spawn_interval
        }}
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            local ad_count = #active_ads
            if ad_count > 0 then
                local x_mult = 1 + (card.ability.extra.x_mult_per_ad * ad_count)
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { x_mult } },
                    Xmult_mod = x_mult
                }
            end
        end
    end
})
