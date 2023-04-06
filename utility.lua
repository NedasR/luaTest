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