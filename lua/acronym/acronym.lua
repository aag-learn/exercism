return function(s)
	local words = s:gmatch("[%a]+")
	local result = ""
	for word in words do
		result = result .. word:sub(1, 1):upper()
		if not word:match("^%u+$") then
			for letter in word:sub(2):gmatch("%u") do
				result = result .. letter:upper()
			end
		end
	end
	return result
end
