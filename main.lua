function love.draw()
    love.graphics.print("Hello World!", 300, 300)
    love.graphics.print("tursty!", 300, 356)
    love.graphics.print("Hello World!", 324, 655)
    love.graphics.print("Hello World!", 540, 400)
  end
local rot = 0
 
local x = 150
local y = 150

local px = 150
local py = 150

local characterSpeed = 5

function love.update(dt)
  px = px - characterSpeed
  rot = rot + 0.05
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

function love.load()
  sprite = love.graphics.newImage("ogre.png")
  shurikenImg = love.graphics.newImage("shuriken.png")
end

function love.draw()
  love.graphics.draw(sprite, x, y)
  love.graphics.draw(shurikenImg, px, py, rot, 0.25, 0.25,330/2, 340/2)
end
 
function love.keypressed( key, scancode, isrepeat )
  if key == "space" then
    px = x
    py = y
  end
end