module Luhn
    def self.valid? input
        return false unless input =~ /^[\d\s]{2,}$/
        input_without_spaces = input.gsub(/\s/, '')
        return false if input_without_spaces == "0"

        doubled = input_without_spaces.chars.reverse.each_with_index.map do |i, index|
            number = i.to_i
            if 0 != index % 2
                number <= 4 ? number * 2 : number * 2 - 9
            else
                number
            end
        end

        doubled.sum % 10 == 0
    end
end