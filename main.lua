function loadMap()
    Message = "It's not lupus"
    TileSet = love.graphics.newImage('countryside.png')

    TileW, TileH = 32, 32
    local tileSetW, tileSetH = TileSet:getWidth(), TileSet:getHeight()

    local quadInfo = {
        { ' ',  0,  0 },  -- 1 = grass
        { '#', 32,  0 },  -- 2 = box
        { '*',  0, 32 },  -- 3 = flowers
        { '^', 32, 32 },  -- 4 = boxTop
    }

    Quads = {}
    
    for _,info in ipairs(quadInfo) do
        Quads[info[1]] = love.graphics.newQuad(info[2], info[3], TileW, TileH, tileSetW, tileSetH)
    end

    local tileString = [[
^#######################^
^                       ^
^                       ^
^                       ^
^     *                 ^
^         *             ^
^               *       ^
^      *                ^
^                 *     ^
^             *         ^
^     *                 ^
^                       ^
^                       ^
                        ^
^                       ^
^         *             ^
^                       ^
^                       ^
#########################
]]
    
    TileTable = {}

    local width = #(tileString:match("[^\n]+"))

    for x = 1,width,1 do TileTable[x] = {} end

    local rowIndex,columnIndex = 1,1 
    for row in tileString:gmatch("[^\n]+") do
        assert(#row == width, 'Map is not aligned: width of row ' .. tostring(rowIndex) .. ' should be ' .. tostring(width) .. ', but it is ' .. tostring(#row))
        columnIndex = 1
        for character in row:gmatch(".") do
            TileTable[columnIndex][rowIndex] = character
            columnIndex = columnIndex + 1
        end
        rowIndex = rowIndex + 1
    end
end

function drawMap()

    for columnIndex,column in ipairs(TileTable) do
        for rowIndex,char in ipairs(column) do
            local x,y = (columnIndex-1)*TileW, (rowIndex-1)*TileH
            love.graphics.drawq(TileSet, Quads[char], x, y)
        end
    end

end



function love.load()
    loadMap()
end

function love.draw()
    drawMap()
end
