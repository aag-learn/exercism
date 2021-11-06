module Isogram
    def self.isogram? word 
        # Improve performance: we can stop  processing the string when we find the first repetition
        # word.empty? || word.downcase.gsub(/[-\s]/,'').chars.reduce({}){|sum, char| sum[char] ? sum[char] += 1 : sum[char] = 1; sum}.values.max == 1

        return true if word.empty?
        is_isogram = true
        word.downcase.gsub(/[-\s]/,'').chars.reduce({}) do |sum, char| 
            if sum[char] 
                is_isogram = false
                break
            else 
                sum[char] = true
            end
            sum
        end
        is_isogram
    end
end
