class Year
    def self.leap? year
        # This is the expression I came up with when I solved this problem in iteration 1
        # year % 4 == 0 && ( year % 100 != 0  || ( year % 100 == 0 && year % 400 == 0 ) )
        #    
        # Let's simplfy this expression using Boolena Algebra
        # (See for example http://www.cse.psu.edu/~kxc104/class/cmpen271/13f/lec/L06NandXorGates.pdf)
        # A = year % 4 == 0
        # B = year % 100 == 0
        # C = year % 400 == 0
        #
        # A * (B' + B*C) -> This is the expression I came up with
        # Using that (A + B) * (A + C) = A + B*C we can rewrite (B' + B*C) as follows:
        #
        # A * ( (B' + B)*(B' + C) )
        # Since B + B' = 1
        #
        # A * (B' + C)
        # Which is:
        year % 4 == 0 && ( year % 100 != 0 || year % 400 == 0 )
    end
end

class Date
    def leap? year
        Year.leap?
    end
end
