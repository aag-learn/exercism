local Hamming = {}

function Hamming.compute(a,b)
	if(#a ~= #b) then return -1 end
	local distance = 0
	for i = 1, #a do
		distance = distance + ( a:sub(i,i) == b:sub(i,i) and 0 or 1 )
	end
	return distance
end

return Hamming
