def steps(number):
    if number <= 0:
        raise ValueError("Only positive integers are allowed")
    current = number
    sequence = []
    while current != 1:
        if current % 2 == 0:
            current = current // 2
        else:
            current = current * 3 + 1

        sequence.append(current)
    return len(sequence)
