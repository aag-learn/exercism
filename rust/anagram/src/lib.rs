use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let lowercased_word = word.to_lowercase();
    let sorted_word = sort_word(&lowercased_word);

    possible_anagrams
        .iter()
        .filter(|item| {
            // The closure passed to filter takes a reference to the item
            // which means that item is a &&str
            let item_lowercased = item.to_lowercase();
            item_lowercased != word.to_lowercase() && sort_word(&item_lowercased) == sorted_word
        }) // This returns an Iterator<Item = &&str>. We use copied to get an Iterator<Item = &str>
        // see https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.filter
        .copied() // This returns an Iterator<Item = &str>
        .collect()
}

// Taken from here: https://stackoverflow.com/a/66289009/1715225
fn sort_word(word: &str) -> Vec<char> {
    let mut sorted_word: Vec<char> = word.chars().collect();
    sorted_word.sort_unstable();
    sorted_word
}
