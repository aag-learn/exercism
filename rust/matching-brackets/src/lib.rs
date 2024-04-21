const BRACKETS: [char; 6] = ['[', ']', '(', ')', '{', '}'];
const OPENING_BRACKETS: [char; 3] = ['[', '(', '{'];
const CLOSING_BRACKETS: [char; 3] = [']', ')', '}'];

pub fn brackets_are_balanced(string: &str) -> bool {
    stacking_brackets(string)
}

// Inspired by https://exercism.org/tracks/rust/exercises/matching-brackets/solutions/Svenito
pub fn stacking_brackets(string: &str) -> bool {
    let mut brackets: Vec<char> = vec![];
    for c in string.chars() {
        match c {
            x if OPENING_BRACKETS.contains(&x) => brackets.push(c),
            x if CLOSING_BRACKETS.contains(&x) => match x {
                ']' => {
                    if brackets.pop() != Some('[') {
                        return false;
                    }
                }
                ')' => {
                    if brackets.pop() != Some('(') {
                        return false;
                    }
                }
                '}' => {
                    if brackets.pop() != Some('{') {
                        return false;
                    }
                }
                _ => (),
            },
            _ => (),
        }
    }
    brackets.is_empty()
}

pub fn replacing_matching_brackets(string: &str) -> bool {
    let mut brackets: String = string.chars().filter(|c| BRACKETS.contains(c)).collect();

    while !brackets.is_empty()
        && (brackets.contains("[]") || brackets.contains("()") || brackets.contains("{}"))
    {
        brackets = brackets.replace("[]", "");
        brackets = brackets.replace("()", "");
        brackets = brackets.replace("{}", "");
    }

    brackets.is_empty()
}
