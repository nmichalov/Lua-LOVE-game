local tileW, tileH, tileSet, quads, tileTable

function loadMap(path)
    love.filesystem.load(path)()
end


function newMap(tileWidth, tileHeight, tileSetPath, tileString, quadInfo)
    tileW = tileWidth
    tileH = tileHeight
    tileSet = love.graphics.newImage(tileSetPath)

    local tileSetW, tileSetH = tileSet:getWidth(), tileSet:getHeight()

    quads = {}

    for _,info in ipairs(quadInfo) do
        quads[info[1]] = love.graphics.newQuad(info[2], info[3], tileW, tileH, tileSetW, tileSetH)
    end

    tileTable = {}

    local width = #(tileString:match("[^\n]+"))

    for x = 1,width,1 do tileTable[x] = {} end

    local x,y = 1,1 
    for row in tileString:gmatch("[^\n]+") do
        assert(#row == width, 'Map is not aligned: width of row ' .. tostring(rowIndex) .. ' should be ' .. tostring(width) .. ', but it is ' .. tostring(#row))
        x = 1
        for character in row:gmatch(".") do
            tileTable[x][y] = character
            x = x + 1
        end
        y = y + 1
    end
end
    
    
function drawMap()
    for columnIndex,column in ipairs(tileTable) do
        for rowIndex,char in ipairs(column) do
            local x,y = (columnIndex-1)*tileW, (rowIndex-1)*tileH
            love.graphics.drawq(tileSet, quads[char], x, y)
        end
    end
    return tileTable
end
