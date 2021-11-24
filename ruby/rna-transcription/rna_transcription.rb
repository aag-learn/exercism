module Complement

    COMPLEMENT = {
        'G' => 'C',
        'C' => 'G',
        'T' => 'A',
        'A' => 'U'
    }
    def self.of_dna strand 
        strand.chars.map{|c| COMPLEMENT[c]}.join('')
    end
end