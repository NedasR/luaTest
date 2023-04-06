-- Removes all elements from the given list if they match the criteria specified by the predicate function
function removeIf(list, predicate)
  local i = 1
  while i <= #list do
    if predicate(list[i]) then
      table.remove(list, i)
    else
      i = i + 1
    end
  end
end


local rot = 0
 
local x = 150
local y = 150

local characterSpeed = 5
local shurikenSpeed = 5

local shurikens = {} -- table / list of all existing shurikens
-- a shuriken will be encoded by a position { x, y } for example { 10, 20 }

function love.update(dt)
  rot = rot + 0.05
  
  for _, shuriken in ipairs(shurikens) do -- for every shuriken in the list,
    shuriken[1] = shuriken[1] - shurikenSpeed -- modify shuriken x-axis coordinate
  end
  
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
  
  
  for _, shuriken in ipairs(shurikens) do -- for every shuriken in the list,
    love.graphics.draw(shurikenImg, shuriken[1], shuriken[2], rot, 0.25, 0.25,330/2, 340/2)
  end
  
  --love.graphics.draw(shurikenImg, px, py, rot, 0.25, 0.25,330/2, 340/2)
end

function love.keypressed( key, scancode, isrepeat )
  if key == "space" then
    local newShuriken = { x, y } -- new shuriken at ogre's position
    table.insert(shurikens, newShuriken)
  end
end