class Triangle

    def initialize sides
        @sides      = sides
        @uniq_sides = sides.uniq
    end

    def equilateral?
        three_sides_equal? && ! all_sides_are_zero?
    end

    def isosceles?
        valid_triangle? && (two_sides_equal? || equilateral? )
    end

    def scalene?
        valid_triangle? && all_sides_different?
    end
    private

    attr_reader :sides, :uniq_sides

    def valid_triangle?
        ( sides[0] + sides[1] >= sides[2] ) &&
        ( sides[0] + sides[2] >= sides[1] ) &&
        ( sides[1] + sides[2] >= sides[0] )   
    end

    def three_sides_equal?
        uniq_sides.count == 1
    end

    def two_sides_equal?
        uniq_sides.count == 2
    end

    def all_sides_different?
        uniq_sides.count == 3
    end

    def all_sides_are_zero?
        uniq_sides.count == 1 && uniq_sides.first == 0
    end
end