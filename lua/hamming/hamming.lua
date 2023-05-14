local Hamming = {}

function Hamming.compute(a,b)
	local distance = 0
	if(#a ~= #b) 
	then
		return -1
	end

	for i =1, #a do
		distance = distance + ( a:sub(i,i) == b:sub(i,i) and 0 or 1 )
	end
	return distance
end

return Hamming
