const BRACKETS: [char; 6] = ['[', ']', '(', ')', '{', '}'];

pub fn brackets_are_balanced(string: &str) -> bool {
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
