module Isogram
    def self.isogram? word 
        word.empty? || word.downcase.gsub(/[-\s]/,'').chars.reduce({}){|sum, char| sum[char] ? sum[char] += 1 : sum[char] = 1; sum}.values.max == 1
    end
end
