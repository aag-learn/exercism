def square(number):
    if number < 1 or number > 64:
        raise ValueError("square must be between 1 and 64")

    if number in (1, 2):
        return number

    return 2 * square(number - 1)


def total():
    accumulated = 0
    for i in range(1, 65):
        accumulated += square(i)

    return accumulated
