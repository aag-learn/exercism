
class Series
    def initialize series
        @series = series
    end

    def slices num_items
        raise ArgumentError.new if num_items > series.length
        series.each_char.each_cons(num_items).map(&:join)
    end

    private 
    attr_reader :series
end