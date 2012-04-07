local tileW, tileH, tileSet, quads, entityInfo, entities
function loadChar(path)
    love.filesystem.load(path)()
end


function newChar(tileWidth, tileHeight, tileSetPath, entInfo)
    tileW = tileWidth
    tileH = tileHeight
    tileSet = love.graphics.newImage(tileSetPath)
    entityInfo = entInfo

    local tileSetW, tileSetH = tileSet:getWidth(), tileSet:getHeight()

    quads = {}

    for _,info in ipairs(entityInfo) do
        quads[info[1]] = love.graphics.newQuad(info[2], info[3], tileW, tileH, tileSetW, tileSetH)
    end

end

function keypress()
    if love.keyboard.isDown("down") then
        player.img = player.imgD
        if testMap(0, 1) then
            player.grid_y = player.grid_y + 32 
        end
    elseif love.keyboard.isDown("up") then
        player.img = player.imgU
        if testMap(0, -1) then
            player.grid_y = player.grid_y - 32
        end
    elseif love.keyboard.isDown("left") then
        player.img = player.imgL
        if testMap(-1, 0) then
            player.grid_x = player.grid_x - 32
        end
    elseif love.keyboard.isDown("right") then
        player.img = player.imgR
        if testMap(1, 0) then
            player.grid_x = player.grid_x + 32
        end
    end
    if love.keyboard.isDown(" ") then
        local fx, fy = player.act_x, player.act_y
        if player.img == player.imgU then
            fy = fy - 160 
            fx = fx -  16 
        elseif player.img == player.imgL then
            fx = fx - 128 
            fy = fy -  64 
        elseif player.img == player.imgR then
            fx = fx + 128
            fy = fy -  64
        elseif player.img == player.imgD then
            fy = fy +  64 
            fx = fx -  16
        end
        love.graphics.draw(fireball, fx, fy, 1, 1)
    end
    print(player.grid_x, player.grid_y, player.grid_x / 32, player.grid_y / 32)
end


function testMap(x,y)
    local spot = mapTable[(player.grid_x / 32)+ x][(player.grid_y / 32) + y]
    if spot == '#' or spot == '^' then
        return false
    end
    if spot == '*' then
        player.img = player.power
    end
    return true
end
