--local spriteInfo = {
--    { 'f1',   0,   0 },
--    { 'f2',  32,   0 },
--    { 'f3',  64,   0 },
--    { 'f4',  96,   0 },
--    { 'l1',   0,  64 },
--    { 'l2',  32,  64 },
--    { 'l3',  64,  64 },
--    { 'l4',  96,  64 },
--    { 'b1',   0, 128 },
--    { 'b2',  32, 128 },
--    { 'b3',  64, 128 },
--    { 'b4',  96, 128 },
--    { 'r1',   0, 192 },
--    { 'r2',  32, 192 },
--    { 'r3',  64, 192 },
--    { 'r4',  96, 192 }
--}

--newChar(32,64,'/imgs/guy/spritesGuy.png',spriteInfo) 

player = {
    img  = love.graphics.newImage('/imgs/guy/guyDown1.png'),
    imgD = love.graphics.newImage('/imgs/guy/guyDown1.png'),
    --  f2 = iDir +
    --  f3 = iDir +
    --  f4 = iDir +
    --  f5 = iDir +
    --  f6 = iDir +
    imgL = love.graphics.newImage('imgs/guy/guyLeft1.png'),
    --  l2 = iDir +
    --  l3 = iDir +
    --  l4 = iDir +
    --  l5 = iDir +
    --  l6 = iDir +
    imgU =  love.graphics.newImage('/imgs/guy/guyUp1.png'),
    --  b2 = iDir +
    --  b3 = iDir +
    --  b4 = iDir +
    --  b5 = iDir +
    --  b6 = iDir +
    imgR = love.graphics.newImage('/imgs/guy/guyRight1.png'),
    --  r2 = iDir +
    --  r3 = iDir +
    --  r4 = iDir +
    --  r5 = iDir +
    --  r6 = iDir +
    grid_x = 256,
    grid_y = 256,
    act_x = 200,
    act_y = 200,
    speed = 10
    }

    fireball = love.graphics.newImage('/imgs/effects/explosion.png')
