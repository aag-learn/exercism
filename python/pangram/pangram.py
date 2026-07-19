"""
Pangram tools
"""

import re


def is_pangram(sentence):
    """
    Checks if a sentence is a pangram (it containes all the letters of the alphabet)

    Parameters:
        sentence (string): The string to test

    Returns:
        boolean: The result of the test
    """
    if sentence:
        return len(set(list(re.sub(r"[^a-z]", "", sentence.lower())))) == 26

    return False
