"""
Helps the king calculate how many grains he need to pay to
his servant
"""

def square(number):
    """
    Returns the number of grains in a particular square of the chess board, 
    given that the first square has one grain and each subsequent square 
    has double the grains of the previous square.

    parameter 
      number: int - the square number (1-64)

    returns
      int - the number of grains on the specified square
    """
    if number < 1 or number > 64:
        raise ValueError("square must be between 1 and 64")

    return 2 ** (number - 1)


def total():
    """
    Returns the totla number of grains on the chess board, which is the sum 
    of grains on all 64 squares.
    """
    accumulated = 0
    for cursor in range(1, 65):
        accumulated += square(cursor)

    return accumulated
