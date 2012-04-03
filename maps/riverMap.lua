local tileString= [[
naaaaaaaaaaaaaaaaaaaaaaat
n                       t
n    a b c d e          t
n    f g h i j          t
n    k l m n            t
n    # q s t u          t
n    v w x y !          t
n                       t
n                       t
n                       t
n                       t
n        n              t
n                       t
n                       t
n                       t
n                       t
n                       t
n                       t
nbbbbbbbbbbbbbbbbbbbbbbbt
]]


    local quadInfo = {
        {  'a',   0,   0  },  -- table upper left
        {  'b',  32,   0  },  -- table upper right
        {  'c',  64,   0  },  -- plate of food
        {  'd',  96,   0  },  -- mushroom
        {  'e', 128,   0  },  -- fence thing
        {  'f',   0,  32  }, 
        {  'g',  32,  32  },
        {  'h',  64,  32  },
        {  'i',  96,  32  },
        {  'j', 128,  32  },
        {  'k',   0,  64  },
        {  'l',  32,  64  },
        {  'm',  64,  64  },
        {  'n',  96,  64  },
        {  ' ', 128,  64  },
        {  '#',   0,  96  },
        {  'q',  32,  96  },
        {  's',  64,  96  },
        {  't',  96,  96  },
        {  'u', 128,  96  },
        {  'v',   0, 128  },
        {  'w',  32, 128  },
        {  'x',  64, 128  },
        {  'y',  96, 128  },
        {  '!', 128, 128  } 
    }    

newMap(32,32,'/imgs/malinkoUse.png',tileString, quadInfo)
