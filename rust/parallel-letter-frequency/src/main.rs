use parallel_letter_frequency::frequency;

fn main() {
    let res = frequency(&[], 4);
    println!("Result = {:?}", res);
    let res = frequency(&["a"], 4);
    println!("Result = {:?}", res);
}
