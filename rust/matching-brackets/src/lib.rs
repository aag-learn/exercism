const BRACKETS: [char; 6] = ['[', ']', '(', ')', '{', '}'];
const OPENING_BRACKETS: [char; 3] = ['[', '(', '{'];
const CLOSING_BRACKETS: [char; 3] = [']', ')', '}'];

pub fn brackets_are_balanced(string: &str) -> bool {
    // replacing_matching_brackets(string)
    let mut stack = vec![];
    for c in string.chars() {
        if BRACKETS.contains(&c) {
            match c {
                x if OPENING_BRACKETS.contains(&x) => stack.push(c),
                x if CLOSING_BRACKETS.contains(&x) => match x {
                    ']' => {
                        if stack.last() == Some(&'[') {
                            stack.pop();
                        } else {
                            return false;
                        }
                    }
                    ')' => {
                        if stack.last() == Some(&'(') {
                            stack.pop();
                        } else {
                            return false;
                        }
                    }
                    '}' => {
                        if stack.last() == Some(&'{') {
                            stack.pop();
                        } else {
                            return false;
                        }
                    }
                    _ => (),
                },
                _ => (),
            }
        }
    }
    stack.is_empty()
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
