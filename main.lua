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
    local imgD = love.graphics.newImage('/imgs/guy/guyDown.png')
    local imgU = love.graphics.newImage('/imgs/guy/guyUp.png')
    local imgL = love.graphics.newImage('/imgs/guy/guyLeft.png')
    local imgR = love.graphics.newImage('/imgs/guy/guyRight.png')
    anim = newAnimation(img, 96, 96, 0.1, 0)
    animD = newAnimation(imgD, 32, 64, 0.05, 0)
    animU = newAnimation(imgU, 32, 64, 0.05, 0)
    animR = newAnimation(imgR, 32, 64, 0.05, 0)
    animL = newAnimation(imgL, 32, 64, 0.05, 0)
    animP = animD
end

function love.update(dt)
    player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
    player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
    anim:update(dt)
    animP:update(dt)
end

function love.draw()
    mapTable, solidSpots = drawMap()
    love.graphics.draw(player.img, player.act_x, player.act_y, 0, 1, 1, 32, 64)
    keypress()
end





