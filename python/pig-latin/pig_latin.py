"""
Pig latin translation utilities
"""

import re

RULE_1_PREFIXES = ("a", "e", "i", "o", "u", "xr", "yt")
RULE_2_PATTERN = r"^([b-df-hj-np-tv-z]+)(.*)"
RULE_3_PATTERN = r"^([b-df-hj-np-tvwxz]*qu)(.*)"
RULE_4_PATTERN = r"^([b-df-hj-np-tvwxz]+)(y.*)"


def translate(text):
    """
    Translate text into pig latin
    """

    words = text.split(" ")
    translated_words = []
    for word in words:
        if word.startswith(RULE_1_PREFIXES):
            translated_words.append(word + "ay")

        match = (
            re.match(RULE_3_PATTERN, word)
            or re.match(RULE_4_PATTERN, word)
            or re.match(RULE_2_PATTERN, word)
        )
        if match:
            translated_words.append(match.group(2) + match.group(1) + "ay")

    return " ".join(translated_words)
