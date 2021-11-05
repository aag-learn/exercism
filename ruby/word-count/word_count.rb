class Phrase

    attr_reader :phrase

    def initialize phrase
        @phrase = phrase
    end

    def word_count
        phrase.downcase.scan(/\b[\w\d']+\b/).reduce({}) do |word_count, word| 
            word_count[word] ?  word_count[word] += 1 : word_count[word] = 1 
            word_count
        end
    end

end