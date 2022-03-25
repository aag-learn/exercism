class SumOfMultiples
    def initialize *multiples
        @multiples = multiples
    end

    def to number
        (1..number-1).reduce(0){|sum, number| (multiple? number) ? sum+number : sum }

        # Another alternative implementation:
        #
        # (1..number-1).select{|number| multiple? number }.sum
        #
        # I don't like this one because we need to find the numbers first and then
        # make a second pass to add them up. In the current implementation
        # we do everything in one pass

    end

    private

    attr_reader :multiples

    def multiple? number
        multiples.any?{|multiple| number % multiple == 0 }
    end
end
