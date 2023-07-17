return function(array, target)
	--if #array < 1 or array[1] > target or array[#array] < target then
	if #array < 1 then
		return -1
	end

	local left = 1
	local right = #array
	local found = -1
	local mid = 0
	while left <= right do
		mid = math.floor((left + right) / 2)
		local value = array[mid]
		print("left  = " .. left)
		print("right = " .. right)
		print("mid   = " .. mid)
		print("target = " .. target .. " value = " .. value)
		if left == right or value == target then
			if value == target then
				found = mid
			end
			break
		elseif value < target then
			left = mid
		else
			right = mid
		end
	end
	return found
end
