def is_armstrong_number(number):
    number_of_digits = len(str(number))
    result = 0
    for digit in str(number):
        result += int(digit) ** number_of_digits

    return result == number
