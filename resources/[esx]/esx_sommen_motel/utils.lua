function table.contains(table, object)
	for index, value in ipairs(table) do
        if value == object then
            return true
        end
    end

    return false
end

function table.dump(tabl)
	if type(tabl) == 'table' then
      local s = '{ '
      for k,v in pairs(tabl) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. table.dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(tabl)
   end
end

function table.copy(table)
  	local empty = {}
  	
  	for k,v in pairs(table) do empty[k] = v end
 	 return setmetatable(empty, getmetatable(table))
end

function string.startsWith(string, value)
   return string.sub(string, 1, string.len(value)) == value
end

function math.round(number)
      if (number - (number % 0.1)) - (number - (number % 1)) < 0.5 then
        number = number - (number % 1)
      else
        number = (number - (number % 1)) + 1
      end
    return number
end

function __genOrderedIndex( t )
    local orderedIndex = {}
    for key in pairs(t) do
        table.insert( orderedIndex, key )
    end
    table.sort( orderedIndex )
    return orderedIndex
end

function orderedNext(t, state)
    local key = nil

    if state == nil then
        t.__orderedIndex = __genOrderedIndex( t )
        key = t.__orderedIndex[1]
    else
        for i = 1, #(t.__orderedIndex) do
            if t.__orderedIndex[i] == state then
                key = t.__orderedIndex[i+1]
            end
        end
    end

    if key then
        return key, t[key]
    end

    t.__orderedIndex = nil
    return
end

function orderedPairs(t)
    return orderedNext, t, nil
end