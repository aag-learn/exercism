"""
    Triangle validations module
"""

def valid_triangle(f):
    """
    Decorator to verify that provided sides can form a triangle.
    """
    def inner(sides):
        (a,b,c) = sides

        if a == b == c == 0.0:
            return False

        return (a + b >= c) and (b + c >= a) and (a + c >= b) and f(sides)

    return inner

@valid_triangle
def equilateral(sides):
    """
    Returns True if the triangle is equilateral, False otherwise.
    """

    (a,b,c) = sides
    return a == b == c

@valid_triangle
def isosceles(sides):
    """
    Returns True if the triangle is isosceles, False otherwise.
    """

    (a,b,c) = sides
    return a == b or a == c or b == c
    # return len(set(sides)) <= 2

@valid_triangle
def scalene(sides):
    """
    Returns True if the triangle is scalene, False otherwise.
    """

    (a,b,c) = sides
    return a != b and a != c and b != c
