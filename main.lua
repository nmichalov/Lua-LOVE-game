require 'map-functions'

function love.load()

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
            
    local quadInfo = {
        { ' ',  0,  0 },  -- 1 = grass
        { '#', 32,  0 },  -- 2 = box
        { '*',  0, 32 },  -- 3 = flowers
        { '^', 32, 32 },  -- 4 = boxTop
    }

    loadMap(32,32,'countryside.png',tileString,quadInfo)

end

function love.draw()
    drawMap()
end
