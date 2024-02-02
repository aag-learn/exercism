use itertools::Itertools;

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
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
