pub fn factors(mut n: u64) -> Vec<u64> {
    let mut factors: Vec<u64> = vec![];
    let mut factor: u64 = 2;
    while n > 1 {
        while n % factor == 0 {
            factors.push(factor);
            n /= factor;
        }
        factor += 1;
    }
    factors
}
