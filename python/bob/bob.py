"""
Bob utility functions
"""


def response(hey_bob):
    """
    Compute Bob response

    Parameters:
        hey_bob (string): What they said to Bob

    Returns:
        text: Bob's response
    """
    remark = hey_bob.strip()

    if not remark:
        return "Fine. Be that way!"

    is_question = remark.endswith("?")
    has_letters = any(char.isalpha() for char in remark)
    is_yelling = has_letters and remark.isupper()

    if is_question and is_yelling:
        return "Calm down, I know what I'm doing!"
    if is_question:
        return "Sure."
    if is_yelling:
        return "Whoa, chill out!"
    return "Whatever."
