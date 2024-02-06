#![feature(test)]
extern crate sum_of_multiples;
extern crate test;

use test::Bencher;

#[bench]
fn bench_tiny_hashset(b: &mut Bencher) {
    let factors = &[2, 3];
    let limit = 10;
    b.iter(|| sum_of_multiples::sum_of_multiples_hashset(limit, factors));
}

#[bench]
fn bench_tiny_vector(b: &mut Bencher) {
    let factors = &[2, 3];
    let limit = 10;
    b.iter(|| sum_of_multiples::sum_of_multiples_vector(limit, factors));
}

#[bench]
fn bench_tiny_simple(b: &mut Bencher) {
    let factors = &[2, 3];
    let limit = 10;
    b.iter(|| sum_of_multiples::sum_of_multiples_vector(limit, factors));
}

#[bench]
fn bench_mid_hashset(b: &mut Bencher) {
    let factors = &[2, 3, 5, 7, 11];
    let limit = 10000;
    b.iter(|| sum_of_multiples::sum_of_multiples_hashset(limit, factors));
}

#[bench]
fn bench_mid_vector(b: &mut Bencher) {
    let factors = &[2, 3, 5, 7, 11];
    let limit = 10000;
    b.iter(|| sum_of_multiples::sum_of_multiples_vector(limit, factors));
}

#[bench]
fn bench_mid_simple(b: &mut Bencher) {
    let factors = &[2, 3, 5, 7, 11];
    let limit = 10000;
    b.iter(|| sum_of_multiples::sum_of_multiples_vector(limit, factors));
}

#[bench]
fn bench_large_hashset(b: &mut Bencher) {
    let factors = &[2, 3, 5, 7, 11, 13, 17];
    let limit = 100000;
    b.iter(|| sum_of_multiples::sum_of_multiples_hashset(limit, factors));
}

#[bench]
fn bench_large_vector(b: &mut Bencher) {
    let factors = &[2, 3, 5, 7, 11, 13, 17];
    let limit = 100000;
    b.iter(|| sum_of_multiples::sum_of_multiples_vector(limit, factors));
}

#[bench]
fn bench_large_simple(b: &mut Bencher) {
    let factors = &[2, 3, 5, 7, 11, 13, 17];
    let limit = 100000;
    b.iter(|| sum_of_multiples::sum_of_multiples_vector(limit, factors));
}
