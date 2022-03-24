class Anagram

    def initialize string
        @word = string.downcase
        @sorted_word = get_sorted_word string
    end

    def match words
        words.select{|item| is_an_anagram? item}
    end
    
    private

    attr_reader :word, :sorted_word

    def get_sorted_word word
        word.downcase.chars.sort.join
    end

    def is_an_anagram? string
        get_sorted_word(string) == sorted_word && string.downcase != word
    end
end