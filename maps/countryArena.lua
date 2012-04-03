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
                        ^
                        ^
^                       ^
^         #             ^
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

newMap(32,32,'/imgs/countryside.png',tileString,quadInfo)
