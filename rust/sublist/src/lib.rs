#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(_first_list: &[T], _second_list: &[T]) -> Comparison {
    match (_first_list.len(), _second_list.len()) {
        (0, 0) => Comparison::Equal,
        (0, _) => Comparison::Sublist,
        (_, 0) => Comparison::Superlist,
        (n, m) if n < m && _second_list.windows(n).any(|x| x == _first_list) => Comparison::Sublist,
        (n, m) if n > m && _first_list.windows(m).any(|x| x == _second_list) => {
            Comparison::Superlist
        }
        (n, m) if n == m && _first_list == _second_list => Comparison::Equal,
        _ => Comparison::Unequal,
    }
}
