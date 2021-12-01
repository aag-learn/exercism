require 'set'

module Pangram
    NUMBER_OF_LETTERS = 26
    def self.pangram? text 
        ("a".."z").all?{|letter| text.downcase.include? letter}
    end
end