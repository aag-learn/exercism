/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    let result: Option<(u32, u32)> =
        code.chars()
            .filter(|&x| !x.is_whitespace())
            .rev()
            .try_fold((0, 0), |(sum, count), val| match val.to_digit(10) {
                None => None,
                Some(x) if (count + 1) % 2 == 1 => Some((sum + x, count + 1)),
                Some(x) if x * 2 > 9 => Some((sum + (x * 2 - 9), count + 1)),
                Some(x) => Some((sum + x * 2, count + 1)),
            });
    match result {
        Some((sum, count)) if count > 1 && sum % 10 == 0 => true,
        _ => false,
    }
}
