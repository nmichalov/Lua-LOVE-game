require 'map-functions'
require 'character-functions'



function love.load()
    --loadMap('/maps/countryArena.lua')
    --loadMap('/maps/riverMap.lua')
    loadMap('/maps/inn.lua')
    --loadChar('/characters/doc.lua')
    loadChar('/characters/guy.lua')
end

function love.update(dt)
    player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
    player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
end

function love.draw()
    mapTable = drawMap()
    love.graphics.draw(player.img, player.act_x, player.act_y, 0, 1, 1, 32, 64)
    keypress()
end





