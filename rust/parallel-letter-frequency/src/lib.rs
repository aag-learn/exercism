use core::cmp::min;
use std::collections::HashMap;
use std::sync::mpsc;
use std::thread;

pub fn frequency(input: &[&str], worker_count: usize) -> HashMap<char, usize> {
    frequency_threads_with_slices(input, worker_count)
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

    let (tx, rx) = mpsc::channel();
    let chunk_size = size_of_chunk(&input, worker_count);

    let mut chunks = input.chars();

    for _ in 0..worker_count {
        let text = chunks.by_ref().take(chunk_size).collect::<String>();
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
    let chunk_size = size_of_chunk(&input, worker_count);

    let mut chunks = input.chars();

    for _ in 0..worker_count {
        let text = chunks.by_ref().take(chunk_size).collect::<String>();
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
// using thread + join and using slices instead of .by_ref().take()
pub fn frequency_threads_with_slices(input: &[&str], worker_count: usize) -> HashMap<char, usize> {
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

fn size_of_chunk(input: &str, worker_count: usize) -> usize {
    let mut size = (input.len() / worker_count).max(1);
    if size * worker_count < input.len() {
        size += 1
    };
    size
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

pub fn frequency_bobahop(input: &[&str], worker_count: usize) -> HashMap<char, usize> {
    let mut answers = HashMap::<char, usize>::new();
    if input.is_empty() {
        return answers;
    }
    let input = input.join("");
    if input.len() == 0 {
        return answers;
    }
    let mut churn = input.chars();

    let real_worker_count = min(input.len(), worker_count);
    let mut thread_pool = Vec::with_capacity(real_worker_count);
    let mut work_length = (input.len() / real_worker_count).max(1);
    if work_length * real_worker_count < input.len() {
        work_length = work_length + 1;
    }

    for _ in 0..real_worker_count {
        let chunk = churn.by_ref().take(work_length).collect::<String>();
        let my_thread = thread::spawn(move || {
            let mut answer = HashMap::<char, usize>::new();
            chunk.chars().for_each(|c| {
                if c.is_alphabetic() {
                    *answer.entry(c.to_ascii_lowercase()).or_default() += 1;
                }
            });
            answer
        });
        thread_pool.push(my_thread);
    }

    for my_thread in thread_pool {
        let answer = my_thread.join().unwrap();
        for (key, val) in answer.iter() {
            *answers.entry(*key).or_default() += val;
        }
    }
    answers
}
