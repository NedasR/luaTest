require("utility")

local shurikenSpeed = 5

local shurikens = {} -- table / list of all existing shurikens
-- a shuriken will be encoded by a position { x, y } for example { 10, 20 }

function loadShuriken()
  shurikenImg = love.graphics.newImage("shuriken.png")
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

function createShuriken(x, y)
  local newShuriken = { x = x, y = y, rot = 0, s} -- new shuriken at ogre's position
  table.insert(shurikens, newShuriken)
end