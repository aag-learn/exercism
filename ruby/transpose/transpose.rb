module Transpose
    def self.transpose input
        return "" if input.empty?
        matrix = input.split("\n").map(&:chars)
        max_length = input.split("\n").map(&:size).max
        
        last_row_with_max_length = matrix.each_index.select{|index| matrix[index].size == max_length }.last
        new_matrix = []

        (0...max_length).each do |index|
            transposed_row = []
            matrix.each_with_index do |row, row_index|               
                if index < row.size
                    transposed_row.push row[index] 
                elsif matrix[(row_index < matrix.size-1 ? row_index+1 : -1)..-1].any?{|i| i.size > index }
                    transposed_row.push " "
                end
            end
            new_matrix.push transposed_row
        end
        
        #matrix = matrix.map{|row| row.size < max_length ? row + (" "*(max_length - row.size)).chars : row}
        #matrix.transpose.map{|c| c.join('')}.map(&:rstrip).join("\n")

        new_matrix.map{|c| c.join('')}.join("\n")
    end
end