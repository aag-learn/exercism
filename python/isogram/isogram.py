import re


def is_isogram(phrase):
    scrubbed = re.sub(r"[^a-zA-Z0-9]", "", phrase.lower())
    return len(scrubbed) == len(set(scrubbed))
