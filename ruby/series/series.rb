
class Series
    def initialize series
        @series = series
    end

    def slices num_items
        raise ArgumentError.new if num_items > series.length
        (0..(series.length - num_items)).map do |i|
            series[i..(i + num_items -1)]
        end
    end

    private 
    attr_reader :series
end