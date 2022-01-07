class Squares
    attr_reader :n

    def initialize n 
        @n = n
    end

    def square_of_sum 
        res =  0
        return 1 if n == 1
        if n % 2 == 0 
            res = square_of_sum_of_even_number n
        else
            res = n + square_of_sum_of_even_number(n-1)
        end

        res**2
    end

    def sum_of_squares
        (1..n).sum{|i| i**2}
    end

    def difference
        square_of_sum - sum_of_squares
    end

    private 

    def square_of_sum_of_even_number n
        n + n/2 + n*(n/2 - 1)
    end
    
end