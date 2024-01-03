pub fn verse(n: u32) -> String {
    match n {
        0 => String::from("No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"),
        1 => String::from("1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"),
        2 => String::from("2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"),
        _ => format!("{} bottles of beer on the wall, {} bottles of beer.\nTake one down and pass it around, {} bottles of beer on the wall.\n", n, n, n-1),
    }
}

pub fn sing(start: u32, end: u32) -> String {
    // Refactoring using the solution from dericy
    // See their solution here: https://exercism.org/tracks/rust/exercises/beer-song/solutions/dericy
    (end..=start)
        .rev()
        // Map expects something that takes one argument
        // So instead of .map(|x| { verse(x) })
        // we can just pass verse as the argument!!
        .map(verse)
        .collect::<Vec<_>>()
        .join("\n")
}
