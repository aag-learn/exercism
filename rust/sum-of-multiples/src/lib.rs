use itertools::Itertools;
use std::collections::HashSet;

// Provide implementations, one using a vector, another one using
// a HashSet and a third one that I saw in the community solutions.
// I was curious about which of the two might perform better,
// so I also added some bechmarks. Apparently, the HashSet version performs
// slightly better:
// test bench_large_hashset ... bench:   3,006,290 ns/iter (+/- 132,081)
// test bench_large_simple  ... bench:   4,080,741 ns/iter (+/- 223,710)
// test bench_large_vector  ... bench:   4,091,591 ns/iter (+/- 367,818)
// test bench_mid_hashset   ... bench:     258,314 ns/iter (+/- 8,254)
// test bench_mid_simple    ... bench:     296,572 ns/iter (+/- 24,528)
// test bench_mid_vector    ... bench:     296,376 ns/iter (+/- 13,966)
// test bench_tiny_hashset  ... bench:         134 ns/iter (+/- 6)
// test bench_tiny_simple   ... bench:         220 ns/iter (+/- 7)
//test bench_tiny_vector   ... bench:         220 ns/iter (+/- 13)
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

pub fn sum_of_multiples_simple(limit: u32, factors: &[u32]) -> u32 {
    (1..limit)
        .filter(|i| factors.iter().any(|f| f != &0 && i % f == 0))
        .sum()
}
