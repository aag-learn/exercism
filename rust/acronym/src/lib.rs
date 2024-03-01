const WORD_SEPARATORS: [char; 3] = [' ', '-', '_'];

pub fn abbreviate(phrase: &str) -> String {
    // abbreviate_mine(phrase)
    // abbreviate_with_map_and_flat(phrase)
    abbreviate_with_flat_map(phrase)
}
// My first iteration, using my mindset to use map-reduce, which in
// rust is the fold method.
pub fn abbreviate_mine(phrase: &str) -> String {
    phrase
        .split(WORD_SEPARATORS)
        .fold("".to_string(), |acc, word| {
            if word.is_empty() {
                return acc;
            };
            let mut chars = word.chars();

            // Get the first character
            let first = chars.next().unwrap().to_ascii_uppercase();

            // Check if there are any lowercase characters left
            if chars.any(|x| x.is_lowercase()) {
                // Add uppercase letters to the acronym
                let uppercase_letters = chars.filter(|&x| x.is_uppercase());
                format!("{acc}{first}{}", String::from_iter(uppercase_letters))
            } else {
                format!("{acc}{first}")
            }
        })
}

// This is my second iteration, in which I learnt about flat_map and I'm trying
// to understand how it works. I iterate in a different way:
// - I return and array of char iterators, and I build the acronym afterwards. In the previous
//   solution I built the acronym on the fly. Doing this allowed me to get rid of the calls to
//   format! since I'm building the acronym at the end
// - I changed the way I look for uppercase letters inside the word, combining skip_while with
//   filter instead of any() and filter()
pub fn abbreviate_with_map_and_flat(phrase: &str) -> String {
    let result = phrase.split(WORD_SEPARATORS).map(|word| {
        word.chars().take(1).chain(
            word.chars()
                .skip_while(|c| c.is_uppercase())
                .filter(|c| c.is_uppercase()),
        )
    });

    result
        .fold("".to_string(), |acc, acronym| {
            format!("{acc}{}", String::from_iter(acronym))
        })
        .to_uppercase()
    //result.flatten().collect::<String>().to_uppercase()
}

// This is my third iteration, in which I undertand how flat_map works.
// It combines an iterator of iterators and flattens them one level
//
// In this case I have an iterator of iterators of chars. If I flatten that,
// I get an iterator of chars
pub fn abbreviate_with_flat_map(phrase: &str) -> String {
    let result = phrase.split(WORD_SEPARATORS).flat_map(|word| {
        word.chars().take(1).chain(
            word.chars()
                .skip_while(|c| c.is_uppercase())
                .filter(|c| c.is_uppercase()),
        )
    });

    result.collect::<String>().to_uppercase()
}
