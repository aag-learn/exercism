module Luhn
    def self.valid? input
        return false unless input =~ /^[\d\s]{2,}$/
        input_without_spaces = input.gsub(/\s/, '')
        return false if input_without_spaces == "0"

        doubled = input_without_spaces.chars.reverse.each_with_index.map do |i, index|
            if 0 != index % 2
                i.to_i <= 4 ? i.to_i * 2 : i.to_i * 2 - 9
            else
                i.to_i
            end
        end

        doubled.sum % 10 == 0
    end
end