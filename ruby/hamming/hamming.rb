module Hamming
    def self.compute string1, string2
        raise ArgumentError.new unless string1.length == string2.length
        (0..string1.length).count{|i| string1[i] != string2[i] }
    end
end