local house = {}

local verses = {
	{ "lay in", "the house that Jack built." },
	{ "ate", "the malt" },
	{ "killed", "the rat" },
	{ "worried", "the cat" },
	{ "tossed", "the dog" },
	{ "milked", "the cow with the crumpled horn" },
	{ "kissed", "the maiden all forlorn" },
	{ "married", "the man all tattered and torn" },
	{ "woke", "the priest all shaven and shorn" },
	{ "kept", "the rooster that crowed in the morn" },
	{ "belonged to", "the farmer sowing his corn" },
	{ "", "the horse and the hound and the horn" },
}

house.verse = function(which)
	local recite = { "This is " .. verses[which][2] }
	for i = which - 1, 1, -1 do
		table.insert(recite, "that " .. verses[i][1] .. " " .. verses[i][2])
	end
	return table.concat(recite, "\n")
end

house.recite = function()
	local recite = {}
	for i = 1, #verses do
		table.insert(recite, house.verse(i))
	end
	return table.concat(recite, "\n")
end

return house
