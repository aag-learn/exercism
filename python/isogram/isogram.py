from collections import Counter
import re


def is_isogram(phrase):
    counts = Counter(re.sub(r"[^a-zA-Z0-9]", "", phrase.lower()))
    return len(counts) == 0 or max(counts.values()) <= 1
