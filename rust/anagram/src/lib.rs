use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    // todo!("For the '{word}' word find anagrams among the following words: {possible_anagrams:?}");
    let lowercase_possible_anagrams: Vec<String> = possible_anagrams
        .iter()
        .map(|item| item.to_lowercase())
        .collect();
    let lowercase_and_sorted_possible_anagrams: Vec<String> = lowercase_possible_anagrams
        .iter()
        .map(|item| {
            let mut chars: Vec<char> = item.chars().collect();
            chars.sort_unstable();
            chars.into_iter().collect()
        })
        .collect();
    let lowercase_word = word.to_lowercase();
    let mut aux: Vec<char> = lowercase_word.chars().collect();
    aux.sort_unstable();
    let lowercase_and_sorted_word: String = aux.into_iter().collect();

    let mut set: HashSet<&str> = HashSet::new();

    for (i, item) in lowercase_and_sorted_possible_anagrams.iter().enumerate() {
        if lowercase_and_sorted_word.eq(item) && lowercase_possible_anagrams[i].ne(&lowercase_word)
        {
            set.insert(possible_anagrams[i]);
        }
    }

    set
}
