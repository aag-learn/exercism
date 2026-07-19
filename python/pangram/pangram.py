"""
Pangram tools
"""

from string import ascii_lowercase

ALPHABET = set(ascii_lowercase)


def is_pangram(sentence):
    """
    Checks if a sentence is a pangram (it containes all the letters of the alphabet)

    Parameters:
        sentence (string): The string to test

    Returns:
        boolean: The result of the test
    """

    return ALPHABET.issubset(sentence.lower())
