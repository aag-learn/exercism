local translate = require("protein-translation")

describe("protein-translation", function()
	describe("translate.codon", function()
		it("should translate AUG to Methionine", function()
			print("Result: " .. translate.codon("AUG"))
			assert.equal("Methionine", translate.codon("AUG"))
		end)
	end)
end)