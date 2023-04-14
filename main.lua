require("shurikens")
local Sound = require("sounds")
local x = 150
local y = 150

local characterSpeed = 5

function handleMovement()
  if love.keyboard.isDown('d') then
    x = x + characterSpeed
  end
  if love.keyboard.isDown('s') then
    y = y + characterSpeed
  end
  if love.keyboard.isDown('a') then
    x = x - characterSpeed
  end
  if love.keyboard.isDown('w') then
    y = y - characterSpeed
  end
end

function love.update(dt)
  updateShurikens()
  handleMovement()
end

function love.load()
  sprite = love.graphics.newImage("ogre.png")
  Sound:inprint('gs', 'cannonshot.mp3', 'static')
  loadShuriken()
end

function love.draw()
  love.graphics.draw(sprite, x, y)
  drawShurikens()
end

function love.keypressed( key, scancode, isrepeat )
  if key == "space" then
  
    Sound:play("gs")
    createShuriken(x, y)
  end
end