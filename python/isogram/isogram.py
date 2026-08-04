"""
isogram tools
"""

import re


def is_isogram(phrase):
    """
    Returns true when the phrase is a isogram

    Parameters:
        phrase (string): The phrase we want to check
    """
    scrubbed = re.sub(r"[^a-zA-Z0-9]", "", phrase.lower())
    return len(scrubbed) == len(set(scrubbed))
