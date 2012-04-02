require 'map-functions'
require 'character-functions'

function love.load()
    loadMap('/maps/countryArena.lua')
    --loadChar('/characters/player.lua')
    player = {
        img = love.graphics.newImage('/imgs/doc.png'),
        imgL = love.graphics.newImage('/imgs/doc.png'),
        imgR = love.graphics.newImage('/imgs/docR.png'),
        imgD = love.graphics.newImage('/imgs/docD.png'),
        imgU = love.graphics.newImage('/imgs/docU.png'),
        grid_x = 256,
        grid_y = 256,
        act_x = 200,
        act_y = 200,
        speed = 10
    }
end

function love.update(dt)
    player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
    player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
end

function love.draw()
    drawMap()
    love.graphics.draw(player.img, player.act_x, player.act_y, 1, 1)
end


function love.keypressed(key)
    if love.keyboard.isDown("down") then
        player.grid_y = player.grid_y + 32
        player.img = player.imgD
    elseif key == "up" then
        player.grid_y = player.grid_y - 32
        player.img = player.imgU
    elseif key == "left" then
        player.grid_x = player.grid_x - 32
        player.img = player.imgL
    elseif key == "right" then
        player.grid_x = player.grid_x + 32
        player.img = player.imgR
    end
end

