use regex::Regex;
use regex::RegexSet;

pub fn reply(message: &str) -> &str {
    let set = RegexSet::new([
        r"[A-Z]+\?\s*$",   // 0: Shouting a question
        r"\?\s*$",         // 1: Asking a question
        r"^[[:space:]]*$", // 2: Silence
        r"[A-Z]+",         // 3: Shouting
    ])
    .unwrap();
    let lowercase = Regex::new(r"[[:lower:]]").unwrap();

    match set.matches(message) {
        c if c.matched(0) && !lowercase.is_match(message) => "Calm down, I know what I'm doing!",
        c if c.matched(1) => "Sure.",
        c if c.matched(2) => "Fine. Be that way!",
        c if c.matched(3) && !lowercase.is_match(message) => "Whoa, chill out!",
        _ => "Whatever.",
    }
}
