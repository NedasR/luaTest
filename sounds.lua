local Sound = {active ={}, source = {}}

function Sound:inprint(id, source, soundType)
    assert(self.source[id] == nil, "Bad ID")
    self.source[id] = love.audio.newSource(source, soundType)
end

function Sound:play(id,channle)
  local channle = channle or "defult"
  local clone = Sound.source[id]:clone()
  clone:play()
  
  if Sound.active[channle] == nil then
     Sound.active[channle] = {}
  end
  table.insert(Sound.active[channle],clone)
end

function Sound:Update()
  for _, channle in pairs(Sound.active) do
     if channle[1] ~= nil and not channle[1]:isPlaying() then
       table.remove(channle,1)
     end
   end
  end
 

return Sound
