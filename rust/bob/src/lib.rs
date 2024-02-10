use regex::Regex;
use regex::RegexSet;

pub fn reply(message: &str) -> &str {
    reply_no_regexp(message)
}

pub fn reply_no_regexp(message: &str) -> &str {
    let trimmed_message = message.trim();

    // no need to do anything else if the message is empty...
    if trimmed_message.is_empty() {
        return "Fine. Be that way!";
    }

    let is_yelling = trimmed_message.contains(char::is_uppercase)
        && !trimmed_message.contains(char::is_lowercase);
    let is_question = trimmed_message.ends_with('?');

    match (is_yelling, is_question) {
        (true, true) => "Calm down, I know what I'm doing!",
        (true, false) => "Whoa, chill out!",
        (false, true) => "Sure.",
        (_, _) => "Whatever.",
    }
}
// The test pass but the solution times out in the servers.
// Mentor told me it was due to using external crates. They might take a
// log time to compile. It's known issue in the rust track.
pub fn reply_regexp(message: &str) -> &str {
    let set = RegexSet::new([
        r"[A-Z]+\?\s*$",   // 0: Shouting a question
        r"\?\s*$",         // 1: Asking a question
        r"^[[:space:]]*$", // 2: Silence
        r"[A-Z]+",         // 3: Shouting
    ])
    .unwrap();

    // Since the regex crate has no lookaround, we'll need to use
    // an extra regexp to check whether they are shouting or not.
    let lowercase = Regex::new(r"[[:lower:]]").unwrap();

    match set.matches(message) {
        c if c.matched(0) && !lowercase.is_match(message) => "Calm down, I know what I'm doing!",
        c if c.matched(1) => "Sure.",
        c if c.matched(2) => "Fine. Be that way!",
        c if c.matched(3) && !lowercase.is_match(message) => "Whoa, chill out!",
        _ => "Whatever.",
    }
}
