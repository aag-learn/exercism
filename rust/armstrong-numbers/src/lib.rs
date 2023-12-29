pub fn is_armstrong_number(num: u32) -> bool {
    let digits: Vec<u64> = u64::from(num)
        .to_string()
        .chars()
        .map(|d| d.to_digit(10).unwrap() as u64)
        .collect();
    let exponent = digits.len() as u32;

    // How I got to do it correctly using an iterator:
    // https://stackoverflow.com/a/69817458/1715225
    let sum: u64 = digits.iter().fold(0, |sum, item| {
        println!("{sum}");
        sum + item.pow(exponent)
    });
    sum == num as u64
}
