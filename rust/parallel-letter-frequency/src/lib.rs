use std::collections::HashMap;
use std::sync::mpsc;
use std::thread;

pub fn frequency(input: &[&str], worker_count: usize) -> HashMap<char, usize> {
    frequency_threads(input, worker_count)
}

// Using a channel
pub fn frequency_channel(input: &[&str], worker_count: usize) -> HashMap<char, usize> {
    let mut answers = HashMap::new();
    if input.is_empty() {
        return answers;
    };

    let input = input.join("");

    if input.is_empty() {
        return answers;
    }
    //let input = input.chars();

    let real_worker_count = if input.len() < 500 {
        return count_letters(&input);
    } else {
        worker_count
    };

    let slice_size = input.len() / real_worker_count;

    let (tx, rx) = mpsc::channel();

    for i in 0..real_worker_count {
        let range_start = i * slice_size;
        let mut range_end = (i + 1) * slice_size;
        if i + 1 == real_worker_count {
            range_end = input.len()
        }
        let text = String::from(&input[range_start..range_end]);
        let cloned_tx = tx.clone();
        thread::spawn(move || {
            cloned_tx.send(count_letters(&text)).unwrap();
        });
    }

    for _ in 1..=real_worker_count {
        let received = rx.recv().unwrap();
        received.iter().for_each(|(&key, &val)| {
            answers.entry(key).and_modify(|e| *e += val).or_insert(val);
        });
    }

    answers
}

// using thread + join
pub fn frequency_threads(input: &[&str], worker_count: usize) -> HashMap<char, usize> {
    let mut answers = HashMap::new();
    if input.is_empty() {
        return answers;
    };

    let input = input.join("");

    if input.is_empty() {
        return answers;
    }

    if input.len() < 100 {
        return count_letters(&input);
    }

    let mut thread_pool = Vec::with_capacity(worker_count);
    let slice_size = input.len() / worker_count;

    for i in 0..worker_count {
        let range_start = i * slice_size;
        let mut range_end = (i + 1) * slice_size;
        if i + 1 == worker_count {
            range_end = input.len()
        }
        let text = String::from(&input[range_start..range_end]);
        let thread = thread::spawn(move || count_letters(&text));
        thread_pool.push(thread);
    }

    for thread in thread_pool {
        let answer = thread.join().unwrap();
        answer.iter().for_each(|(&key, &val)| {
            *(answers.entry(key).or_insert(0)) += val;
        });
    }
    answers
}

fn count_letters(input: &str) -> HashMap<char, usize> {
    let mut ret = HashMap::new();
    for c in input.chars() {
        if c.is_alphabetic() {
            *(ret.entry(c.to_ascii_lowercase()).or_insert(0)) += 1;
        };
    }
    ret
}
