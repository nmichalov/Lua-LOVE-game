require 'map-functions'
require 'character-functions'

local mapTable, spot, player, fireball

function love.load()
    --loadMap('/maps/countryArena.lua')
    --loadMap('/maps/riverMap.lua')
    loadMap('/maps/inn.lua')
    player = {
        img = love.graphics.newImage('/imgs/doc.png'),
        imgL = love.graphics.newImage('/imgs/doc.png'),
        imgR = love.graphics.newImage('/imgs/docR.png'),
        imgD = love.graphics.newImage('/imgs/docD.png'),
        imgU = love.graphics.newImage('/imgs/docU.png'),
        power = love.graphics.newImage('/imgs/powerUp.png'),
        grid_x = 256,
        grid_y = 256,
        act_x = 200,
        act_y = 200,
        speed = 10
    }
    fireball = love.graphics.newImage('/imgs/explosion.png')
end

function love.update(dt)
    player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
    player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
end

function love.draw()
    mapTable = drawMap()
    love.graphics.draw(player.img, player.act_x, player.act_y, 1, 1)
end


function love.keypressed()
    if love.keyboard.isDown("down") then
        player.img = player.imgD
        if testMap(0, 2) then
            player.grid_y = player.grid_y + 32
        end
    elseif love.keyboard.isDown("up") then
        player.img = player.imgU
        if testMap(0, 0) then
            player.grid_y = player.grid_y - 32
        end
    elseif love.keyboard.isDown("left") then
        player.img = player.imgL
        if testMap(-1, 1) then
            player.grid_x = player.grid_x - 32
        end
    elseif love.keyboard.isDown("right") then
        player.img = player.imgR
        if testMap(1, 1) then
            player.grid_x = player.grid_x + 32
        end
    elseif love.keyboard.isDown(" ") then
        local fx, fy = player.act_x, player.act_y
        if player.img == player.imgU then
            fy = fy - 64
        elseif player.img == player.imgL then
            fx = fx - 64
        elseif player.img == player.imgR then
            fx = fx + 64
        elseif player.img == player.img then
            fy = fy + 64
        end
        love.graphics.draw(fireball, fx, fy, 1, 1)
    end
    print(player.grid_x, player.grid_y, player.grid_x/32, player.grid_y/32)
end


function testMap(x,y)
    spot = mapTable[(player.grid_x / 32) + x][(player.grid_y / 32) + y]
    print(spot)
    if spot == '#' or spot == '^' then
        return false
    end
    if spot == '*' then
        player.img = player.power
    end
    return true
end


