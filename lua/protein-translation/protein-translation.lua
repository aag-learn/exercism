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
	if #rna_strand % 3 ~= 0 then
		error("Incomplete sequence!!")
	end

	local result = {}
	for codon in rna_strand:gmatch("...") do
		local protein = translate_codon(codon)
		if protein == "STOP" then
			break
		else
			table.insert(result, protein)
		end
	end

	return result
end

return { codon = translate_codon, rna_strand = translate_rna_strand }
