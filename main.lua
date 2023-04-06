require("utility")

local x = 150
local y = 150

local characterSpeed = 5
local shurikenSpeed = 5

local shurikens = {} -- table / list of all existing shurikens
-- a shuriken will be encoded by a position { x, y } for example { 10, 20 }

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

function updateShurikens()
  for _, shuriken in ipairs(shurikens) do -- for every shuriken in the list,
    shuriken.x = shuriken.x - shurikenSpeed -- modify shuriken x-axis coordinate
    shuriken.rot = shuriken.rot + 0.05 -- modify shuriken rotation
  end
  
  -- remove all off-screen shurikens :
  removeIf(shurikens, function (element) return element.x < 0 end)
end

function drawShurikens()
  for _, shuriken in ipairs(shurikens) do -- for every shuriken in the list,
    love.graphics.draw(shurikenImg, shuriken.x, shuriken.y, shuriken.rot, 0.25, 0.25,330/2, 340/2)
  end
end

function createShuriken()
  local newShuriken = { x = x, y = y, rot = 0 } -- new shuriken at ogre's position
  table.insert(shurikens, newShuriken)
end

function love.update(dt)
  updateShurikens()
  handleMovement()
end

function love.load()
  sprite = love.graphics.newImage("ogre.png")
  shurikenImg = love.graphics.newImage("shuriken.png")
end

function love.draw()
  love.graphics.draw(sprite, x, y)
  
  drawShurikens()
end

function love.keypressed( key, scancode, isrepeat )
  if key == "space" then
    createShuriken()
  end
end