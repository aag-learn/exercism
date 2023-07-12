return function(array, target)
	if #array < 1 then
		return -1
	end
	local found = nil
	local index = math.ceil(#array / 2)
	repeat
		-- Have we found the target?
		if array[index] == target then
			found = index
		else
			-- No, so check if we are at the beginning or end of the array
			if index == 1 or index == #array then
				found = -1
			-- If we are not, then get the next index and continue
			elseif array[index] < target then
				index = math.ceil((#array + index) / 2)
			else
				index = math.ceil(index / 2)
			end
		end
	until found ~= nil
	return found
end
