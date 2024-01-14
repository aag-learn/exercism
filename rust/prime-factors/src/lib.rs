pub fn factors(n: u64) -> Vec<u64> {
    let mut factors: Vec<u64> = vec![];
    let mut factor: u64 = 2;
    let mut aux = n;
    while aux > 1 {
        if aux % factor == 0 {
            factors.push(factor);
            aux /= factor;
        } else {
            factor += 1;
        }
    }
    factors
}
