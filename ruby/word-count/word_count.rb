class Phrase

    attr_reader :phrase

    def initialize phrase
        @phrase = phrase
    end

    def word_count
        phrase.scan(/\b[\w\d']+\b/).reduce({}) do |word_count, word| 
            key = word.downcase
            word_count[key] ?  word_count[key] += 1 : word_count[key] = 1 
            word_count
        end
    end

end