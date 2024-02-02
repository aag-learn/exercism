use itertools::Itertools;
use std::collections::HashSet;

// Provide two implementations, one using a vector an another one using
// a HashSet. I was curious about which of the two might perform better,
// so I also added some bechmarks. Apparently, the HashSet version performs
// slightly better:
// test bench_mid_hashset  ... bench:     267,133 ns/iter (+/- 9,473)
// test bench_mid_vector   ... bench:     321,310 ns/iter (+/- 16,205)
// test bench_tiny_hashset ... bench:         139 ns/iter (+/- 5)
// test bench_tiny_vector  ... bench:         215 ns/iter (+/- 30)
//
pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    sum_of_multiples_hashset(limit, factors)
}

pub fn sum_of_multiples_vector(limit: u32, factors: &[u32]) -> u32 {
    let mut answer: Vec<u32> = vec![];

    for factor in factors.iter().filter(|&&x| x > 0) {
        answer.extend(
            (1..=(limit / factor))
                .map(|x| x * factor)
                .filter(|&x| x < limit)
                .collect::<Vec<u32>>(),
        );
    }
    answer.iter().unique().sum()
}

pub fn sum_of_multiples_hashset(limit: u32, factors: &[u32]) -> u32 {
    let mut answers = HashSet::new();
    factors.iter().filter(|&&x| x > 0).for_each(|factor| {
        (1..=(limit / factor)).for_each(|x| {
            if x * factor < limit {
                answers.insert(x * factor);
            };
        });
    });
    answers.iter().sum()
}
