local MAP <const> = {
	Methionine = { "AUG" },
	Phenylalanine = { "UUU", "UUC" },
	Leucine = { "UUA", "UUG" },
	Serine = { "UCU", "UCC", "UCA", "UCG" },
	Tyrosine = { "UAU", "UAC" },
	Cysteine = { "UGU", "UGC" },
	Tryptophan = { "UGG" },
	STOP = { "UAA", "UAG", "UGA" },
}

local function translate_codon(codon)
	for protein, codons in pairs(MAP) do
		for _i, value in ipairs(codons) do
			if value == codon then
				return protein
			end
		end
	end
	error("Unknown codon: " .. codon)
end

local function translate_rna_strand(rna_strand)
	local start_at = 1
	local end_at = 3
	local length = rna_strand:len()
	local result = {}
	while end_at <= length do
		local slice = rna_strand:sub(start_at, end_at)
		local protein = translate_codon(slice)
		if protein == "STOP" then
			return result
		else
			table.insert(result, protein)
			if length - end_at == 0 or length - end_at > 2 then
				start_at = end_at + 1
				end_at = end_at + 3
			else
				error("Incomplete sequence!!")
			end
		end
	end

	return result
end

return { codon = translate_codon, rna_strand = translate_rna_strand }
