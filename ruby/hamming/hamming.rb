module Hamming
    def self.compute string1, string2
        raise ArgumentError.new unless string1.length == string2.length
        distance = 0
        (0..string1.length).each{|index| distance += string1[index] == string2[index] ? 0 : 1 }
        distance
    end
end