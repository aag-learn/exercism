pub fn raindrops(n: u32) -> String {
    let speak = [3, 5, 7].iter().fold(String::from(""), |acc, &factor| {
        match (factor, n % factor) {
            (3, 0) => acc + "Pling",
            (5, 0) => acc + "Plang",
            (7, 0) => acc + "Plong",
            _ => acc,
        }
    });

    if speak.is_empty() {
        n.to_string()
    } else {
        speak
    }
}
