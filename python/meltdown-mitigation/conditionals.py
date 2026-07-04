"""Functions to prevent a nuclear meltdown."""

CRITICALITY_TEMPERATURE = 800
EMITTED_NEUTRON_FLOW_THRESHOLD = 500
CRITICALITY_THRESHOLD = 500_000

FAIL_SAFE_LOW = "LOW"
FAIL_SAFE_NORMAL = "NORMAL"
FAIL_SAFE_DANGER = "DANGER"


def is_criticality_balanced(temperature, neutrons_emitted):
    """Verify criticality is balanced.

    Parameters:
        temperature (int or float): The temperature value in kelvin.
        neutrons_emitted (int or float): The number of neutrons emitted per second.

    Returns:
        bool: Is criticality balanced?

    Note:
        A reactor is said to be balanced in criticality if it satisfies the following conditions:
            - The temperature is less than 800 K.
            - The number of neutrons emitted per second is greater than 500.
            - The product of temperature and neutrons emitted per second is less than 500000.

    """
    return (
        temperature < CRITICALITY_TEMPERATURE
        and neutrons_emitted > EMITTED_NEUTRON_FLOW_THRESHOLD
        and temperature * neutrons_emitted < CRITICALITY_THRESHOLD
    )


def reactor_efficiency(voltage, current, theoretical_max_power):
    """Assess reactor efficiency zone.

    Parameters:
        voltage (int or float): Voltage value.
        current (int or float): Current value.
        theoretical_max_power (int or float): The power level that corresponds to a 100% efficiency.

    Returns:
        str: One of ('green', 'orange', 'red', or 'black').

    Note:
        Efficiency can be grouped into 4 bands:
            1. green -> efficiency of 80% or more,
            2. orange -> efficiency of less than 80% but at least 60%,
            3. red -> efficiency below 60%, but still 30% or more,
            4. black ->  less than 30% efficient.

        The percentage value is calculated as
        (generated power/ theoretical max power)*100
        where generated power = voltage * current
    """
    generated_power = voltage * current

    match generated_power * 100 / theoretical_max_power:
        case n if n >= 80.0:
            return "green"
        case n if 60.0 <= n < 80.0:
            return "orange"
        case n if 30.0 <= n < 60.0:
            return "red"
        case _:
            return "black"


def fail_safe(temperature, neutrons_produced_per_second, threshold):
    """Assess and return status code for the reactor.

    Parameters:
        temperature (int or float): The value of the temperature in kelvin.
        neutrons_produced_per_second (int or float): The neutron flux.
        threshold (int or float): The threshold for the category.

    Returns:
        str: One of ('LOW', 'NORMAL', 'DANGER').

    Note:
        1. 'LOW' -> `temperature * neutrons per second` < 90% of `threshold`
        2. 'NORMAL' -> `temperature * neutrons per second` +/- 10% of `threshold`
        3. 'DANGER' -> `temperature * neutrons per second` is not in the above-stated ranges
    """

    product = temperature * neutrons_produced_per_second
    if product < 0.9 * threshold:
        return FAIL_SAFE_LOW

    if 0.9 * threshold <= product <= 1.1 * threshold:
        return FAIL_SAFE_NORMAL

    return FAIL_SAFE_DANGER
