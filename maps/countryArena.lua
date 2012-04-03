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
        { ' ',  0,  0, pass=true  },  -- 1 = grass
        { '#', 32,  0, pass=false },  -- 2 = box
        { '*',  0, 32, pass=true  },  -- 3 = flowers
        { '^', 32, 32, pass=false },  -- 4 = boxTop
    }

newMap(32,32,'/imgs/countryside.png',tileString,quadInfo)
