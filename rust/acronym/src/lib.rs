const WORD_SEPARATORS: [char; 4] = [' ', '-', '_', ','];

pub fn abbreviate(phrase: &str) -> String {
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
