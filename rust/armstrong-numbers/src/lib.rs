pub fn is_armstrong_number(num: u64) -> bool {
    let digits: Vec<u64> = num
        .to_string()
        .chars()
        .map(|d| d.to_digit(10).unwrap() as u64)
        .collect();
    let exponent = digits.len() as u32;

    // How I got to do it correctly using an iterator:
    // https://stackoverflow.com/a/69817458/1715225
    num == digits.iter().fold(0, |sum, item| sum + item.pow(exponent))
}
