require 'set'

module Pangram
    NUMBER_OF_LETTERS = 26
    def self.pangram? text 
        text.
            downcase.
            scan(/[a-z]/).
            reduce(Set.new){|set, letter| set.add(letter); set}.
            size == NUMBER_OF_LETTERS
    end
end