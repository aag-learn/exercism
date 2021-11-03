class Matrix
    attr_reader :columns, :rows
    
    def initialize data
        @rows = data.split("\n").map{|row| row.strip.split.map(&:to_i)}
        @columns = rows.transpose
    end
end
