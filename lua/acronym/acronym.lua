return function(s)
	-- Solution inspired in the one by ryanplusplus
	-- https://exercism.org/tracks/lua/exercises/acronym/solutions/ryanplusplus
	local acronym = {}
	s:gsub("%u*%l*", function(match)
		table.insert(acronym, match:sub(1, 1):upper())
	end)
	return table.concat(acronym, "")
end
