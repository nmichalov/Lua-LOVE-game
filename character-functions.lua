local tileW, tileH, tileSet, quads, entityInfo, entitie
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
        animP = animD
        --temp = player.imgR
        if testMap(0, 1) then
            player.grid_y = player.grid_y + 32 
        end
    elseif love.keyboard.isDown("up") then
        animP = animU
        --temp = player.imgR
        if testMap(0, -1) then
            player.grid_y = player.grid_y - 32
        end
    elseif love.keyboard.isDown("left") then
        animP = animL
        --temp = player.imgR
        if testMap(-1, 0) then
            player.grid_x = player.grid_x - 32
        end
    elseif love.keyboard.isDown("right") then
        animP = animR
        --temp = player.imgR
        if testMap(1, 0) then
            player.grid_x = player.grid_x + 32
        end
    end
    player.img = player.imgMove
    animP:draw(player.act_x - 32, player.act_y - 64)
    --player.img = temp
    if love.keyboard.isDown(" ") then
        local fx, fy = player.act_x, player.act_y
        if player.img == player.imgU then
            fy = fy - 160 
            fx = fx -  32 
        elseif player.img == player.imgL then
            fx = fx - 128 
            fy = fy -  64 
        elseif player.img == player.imgR then
            fx = fx +  96
            fy = fy -  64
        elseif player.img == player.imgD then
            fy = fy +  64 
            fx = fx -  32 
        end
        anim:draw(fx, fy)
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
