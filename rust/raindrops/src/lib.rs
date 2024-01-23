pub fn raindrops(n: u32) -> String {
    if n % 3 != 0 && n % 5 != 0 && n % 7 != 0 {
        return n.to_string();
    }

    [3, 5, 7].iter().fold(String::from(""), |acc, &factor| {
        match (factor, n % factor) {
            (3, 0) => acc + "Pling",
            (5, 0) => acc + "Plang",
            (7, 0) => acc + "Plong",
            _ => acc,
        }
    })
}
