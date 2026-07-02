"""
Helper methods to work with Armstrong numbers
"""


def is_armstrong_number(number):
    """
    Returns True if a number is an armstrong number.
    """
    number_of_digits = len(str(number))
    result = 0
    for digit in str(number):
        result += int(digit) ** number_of_digits

    return result == number
