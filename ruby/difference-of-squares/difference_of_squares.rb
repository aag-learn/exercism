# See https://brilliant.org/wiki/sum-of-n-n2-or-n3/ for the formulas
class Squares
    attr_reader :n

    def initialize n 
        @n = n
    end

    def square_of_sum 
        ((n + 1) * n / 2)**2
    end

    def sum_of_squares
        n * (n + 1) * (2*n + 1) / 6
    end

    def difference
        square_of_sum - sum_of_squares
    end
    
end