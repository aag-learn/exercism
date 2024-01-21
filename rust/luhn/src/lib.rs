/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    let code_without_spaces: Vec<char> = code.chars().filter(|&x| !x.is_whitespace()).collect();

    let result: Option<u32> = code_without_spaces
        .iter()
        .rev()
        .enumerate()
        .map(|(index, c)| match ((index + 1) % 2, c.to_digit(10)) {
            (0, Some(x)) if x * 2 <= 9 => Some(x * 2),
            (0, Some(x)) => Some((x * 2) - 9),
            (_, Some(x)) => Some(x),
            (_, None) => None,
        })
        .try_fold(0, |acc, digit| match (acc, digit) {
            (acc, Some(digit)) => Some(acc + digit),
            (_, None) => None,
        });
    match result {
        None => false,
        Some(x) if x != 0 && x % 10 == 0 => true,
        Some(x) if x == 0 && code_without_spaces.len() > 1 => true,
        Some(_) => false,
    }
}
