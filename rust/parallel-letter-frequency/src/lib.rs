use std::collections::HashMap;
use std::sync::mpsc;
use std::thread;

pub fn frequency(input: &[&str], worker_count: usize) -> HashMap<char, usize> {
    if input.is_empty() {
        return HashMap::new();
    };
    let (tx, rx) = mpsc::channel();
    let chunks = input.chunks(worker_count);
    let chunk_number = chunks.len();
    chunks.for_each(|chunk| {
        let cloned_tx = tx.clone();
        let combined: String = chunk.join("");
        thread::spawn(move || {
            cloned_tx.send(count_letters(&combined)).unwrap();
        });
    });

    let mut results = HashMap::new();
    for _ in 1..=chunk_number {
        let received = rx.recv().unwrap();
        received.iter().for_each(|(&key, &val)| {
            results.entry(key).and_modify(|e| *e += val).or_insert(val);
        });
    }

    results
}

fn count_letters(input: &str) -> HashMap<char, usize> {
    input.chars().fold(HashMap::new(), |mut ret, c| {
        if c.is_alphabetic() {
            ret.entry(c.to_ascii_lowercase())
                .and_modify(|count| *count += 1)
                .or_insert(1);
        }
        ret
    })
}
