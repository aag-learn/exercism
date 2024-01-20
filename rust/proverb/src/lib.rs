pub fn build_proverb(list: &[&str]) -> String {
    let mut proverb: Vec<String> = list
        .windows(2)
        .map(|x| format!("For want of a {} the {} was lost.", x[0], x[1]))
        .collect();
    if !list.is_empty() {
        proverb.push(format!(
            "And all for the want of a {}.",
            list.first().unwrap()
        ));
    }
    proverb.join("\n")
}
