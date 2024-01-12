pub fn nth(n: u32) -> u32 {
    let mut primes: Vec<u32> = vec![2];
    let mut index = 2;
    while (primes.len() as u32) < (n + 1) {
        match primes.iter().any(|prime| index % prime == 0) {
            false => primes.push(index),
            true => (),
        }
        index += 1;
    }
    *primes.last().unwrap()
}
