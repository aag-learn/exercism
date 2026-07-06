"""
Raindrops utility module
"""


def convert(number):
    """Convert a number to its raindrop representation.

    Parameters:
        number (int): The number to convert.

    Returns:
        str: A string containing "Pling" if the number is divisible by 3,
        "Plang" if it is divisible by 5, and "Plong" if it is divisible
        by 7. If the number is not divisible by any of these factors,
        returns the number as a string.
    """
    sound = ""

    div_by_3 = number % 3 == 0
    div_by_5 = number % 5 == 0
    div_by_7 = number % 7 == 0

    if div_by_3:
        sound += "Pling"
    if div_by_5:
        sound += "Plang"
    if div_by_7:
        sound += "Plong"

    if not (div_by_3 or div_by_5 or div_by_7):
        sound = str(number)
    return sound
