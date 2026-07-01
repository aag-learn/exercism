"""
    Triangle validations module
"""

def equilateral(sides):
    """
    Returns True if the triangle is equilateral, False otherwise.
    """
    if not is_a_triangle(sides):
        return False

    (a,b,c) = sides
    return a == b == c

def isosceles(sides):
    """
    Returns True if the triangle is isosceles, False otherwise.
    """

    if not is_a_triangle(sides):
        return False

    (a,b,c) = sides
    return a == b or a == c or b == c
    # return len(set(sides)) <= 2

def scalene(sides):
    """
    Returns True if the triangle is scalene, False otherwise.
    """

    if not is_a_triangle(sides):
        return False

    (a,b,c) = sides
    return a != b and a != c and b != c

def is_a_triangle(sides):
    """
    Returns True if the sides can form a triangle, False otherwise.

    For example, if all sides are zero, it is not a triangle. If the sum of any two sides is less than the third side, it is not a triangle.
    """

    (a,b,c) = sides

    if a == b == c == 0.0:
        return False

    return (a + b >= c) and (b + c >= a) and (a + c >= b)
