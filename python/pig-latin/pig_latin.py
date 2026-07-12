"""
Pig latin translation utilities
"""

import re

RULE_1_PREFIXES = ("a", "e", "i", "o", "u", "xr", "yt")
RULE_PATTERNS = (
    re.compile(r"^([b-df-hj-np-tvwxz]*qu)(.*)"),
    re.compile(r"^([b-df-hj-np-tvwxz]+)(y.*)"),
    re.compile(r"^([b-df-hj-np-tvwxyz]+)(.*)"),
)


def _translate_word(word):
    if word.startswith(RULE_1_PREFIXES):
        return f"{word}ay"

    for pattern in RULE_PATTERNS:
        if match := pattern.match(word):
            prefix, rest = match.groups()
            return f"{rest}{prefix}ay"

    return word


def translate(text):
    """
    Translate text into pig latin.
    """

    return " ".join(_translate_word(word) for word in text.split())
