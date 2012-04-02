require 'map-functions'

function love.load()
    loadMap('/maps/countryArena.lua')
end

function love.draw()
    drawMap()
end
