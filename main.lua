require 'map-functions'
require 'character-functions'

local mapTable, spot

function love.load()
    loadMap('/maps/countryArena.lua')
    --loadMap('/maps/riverMap.lua')
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
    mapTable = drawMap()
    love.graphics.draw(player.img, player.act_x, player.act_y, 1, 1)
end


function love.keypressed(key)
    if love.keyboard.isDown("down") then
        player.img = player.imgD
        if testMap(0, 2) then
            player.grid_y = player.grid_y + 32
        end
    elseif key == "up" then
        player.img = player.imgU
        if testMap(0, 0) then
            player.grid_y = player.grid_y - 32
        end
    elseif key == "left" then
        player.img = player.imgL
        if testMap(-1, 1) then
            player.grid_x = player.grid_x - 32
        end
    elseif key == "right" then
        player.img = player.imgR
        if testMap(1, 1) then
            player.grid_x = player.grid_x + 32
        end
    end
    print(player.grid_x, player.grid_y, player.grid_x/32, player.grid_y/32)
end

function testMap(x,y)
    spot = mapTable[(player.grid_x / 32) + x][(player.grid_y / 32) + y]
    print(spot)
    if spot == '#' or spot == '^' then
        return false
    end
    return true
end


