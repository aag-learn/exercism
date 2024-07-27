return function(n)
	local co = coroutine.create(function()
		local test = {}
		for i = 2, n do
			if not test[i] then
				for j = i * i, n, i do
					test[j] = true
				end
				coroutine.yield(i)
			end
		end
	end)
	return co
end
