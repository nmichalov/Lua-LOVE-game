require 'map-functions'
require 'character-functions'
require 'AnAL'



function love.load()
    --loadMap('/maps/countryArena.lua')
    --loadMap('/maps/riverMap.lua')
    loadMap('/maps/inn.lua')
    --loadChar('/characters/doc.lua')
    loadChar('/characters/guy.lua')
    local img = love.graphics.newImage('/imgs/effects/AnalExplosion.png')
    anim = newAnimation(img, 96, 96, 0.1, 0)
end

function love.update(dt)
    player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
    player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
    anim:update(dt)
end

function love.draw()
    mapTable = drawMap()
    love.graphics.draw(player.img, player.act_x, player.act_y, 0, 1, 1, 32, 64)
    keypress()
end





