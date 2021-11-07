class Scrabble
    @@points = {
        "AEIOULNRST" => 1,
        "DG"         => 2,
        "BCMP"       => 3,
        "FHVWY"      => 4,
        "K"          => 5,
        "JX"         => 8,
        "QZ"         => 10
    }
    attr_reader :word
    def initialize word
        @word = word || ''
    end

    def score
        word.upcase.chars.map{|letter| score_for_letter letter }.sum
    end

    def self.score word
        Scrabble.new(word).score
    end

    private 

    def score_for_letter letter
        @@points.select{|key, value| key.include? letter}.values.first || 0
    end
end
