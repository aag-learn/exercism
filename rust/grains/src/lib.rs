pub fn square(s: u32) -> u64 {
    if !(1..=64).contains(&s) {
        panic!("Square must be between 1 and 64")
    }
    let base: u64 = 2;
    base.pow(s - 1)
}

pub fn total() -> u64 {
    (1..=64).fold(0, |acc, x| acc + square(x))
}
