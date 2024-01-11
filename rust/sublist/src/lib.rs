#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(_first_list: &[T], _second_list: &[T]) -> Comparison {
    if _first_list == _second_list {
        Comparison::Equal
    } else if (_first_list.len() < _second_list.len()) && contains_slice(_second_list, _first_list)
    {
        Comparison::Sublist
    } else if (_first_list.len() > _second_list.len()) && contains_slice(_first_list, _second_list)
    {
        Comparison::Superlist
    } else {
        Comparison::Unequal
    }
}

fn contains_slice<T: PartialEq>(list: &[T], slice: &[T]) -> bool {
    if slice.is_empty() {
        return true;
    }
    list.windows(slice.len()).any(|x| x == slice)
}
