local house = {}

local verses = {
	{ "lay in", "the house that Jack built." },
	{ "ate", "the malt" },
	{ "killed", "the rat" },
	{ "worried", "the cat" },
	{ "tossed", "the dog" },
	{ "milked", "the cow with the crumpled horn" },
}

house.verse = function(which)
	if which == 1 then
		return "This is " .. verses[1][2]
	end
end

house.recite = function() end

return house
