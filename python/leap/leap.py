"""
Leap year helper module.
"""

def leap_year(year):
    """
    Returns True if the given year is a leap year, False otherwise.
    """
    return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)
