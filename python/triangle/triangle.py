"""
    Triangle validations module
"""

def valid_triangle(f):
    """
    Decorator to verify that provided sides can form a triangle.
    """
    def inner(sides):
        return sum(sides) > 2 * max(sides) and f(sides)

    return inner

@valid_triangle
def equilateral(sides):
    """
    Returns True if the triangle is equilateral, False otherwise.
    """

    return len(set(sides)) == 1

@valid_triangle
def isosceles(sides):
    """
    Returns True if the triangle is isosceles, False otherwise.
    """

    return len(set(sides)) <= 2

@valid_triangle
def scalene(sides):
    """
    Returns True if the triangle is scalene, False otherwise.
    """
    return len(set(sides)) == 3

