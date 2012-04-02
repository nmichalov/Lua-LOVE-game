function newMap(tileW, tileH, tileSetPath, tileString, quadInfo)
    TileW = tileW
    TileH = tileH
    TileSet = love.graphics.newImage(tileSetPath)

    local tileSetW, tileSetH = TileSet:getWidth(), TileSet:getHeight()

    Quads = {}
    for _,info in ipairs(quadInfo) do
        Quads[info[1]] = love.graphics.newQuad(info[2], info[3], TileW, TileH, tileSetW, tileSetH)
    end

    TileTable = {}

    local width = #(tileString:match("[^\n]+"))

    for x = 1,width,1 do TileTable[x] = {} end

    local x,y = 1,1 
    for row in tileString:gmatch("[^\n]+") do
        assert(#row == width, 'Map is not aligned: width of row ' .. tostring(rowIndex) .. ' should be ' .. tostring(width) .. ', but it is ' .. tostring(#row))
        x = 1
        for character in row:gmatch(".") do
            TileTable[x][y] = character
            x = x + 1
        end
        y = y + 1
    end
end
    
    
function loadMap(path)
    local f = love.filesystem.load(path)
    f()
end


function drawMap()

    for columnIndex,column in ipairs(TileTable) do
        for rowIndex,char in ipairs(column) do
            local x,y = (columnIndex-1)*TileW, (rowIndex-1)*TileH
            love.graphics.drawq(TileSet, Quads[char], x, y)
        end
    end

end

