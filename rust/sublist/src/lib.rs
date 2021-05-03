#[derive(Debug, PartialEq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(first_list: &[T], second_list: &[T]) -> Comparison {
    match (first_list.len(), second_list.len()) {
        (0, 0) => Comparison::Equal,
        (0, _) => Comparison::Sublist,
        (_, 0) => Comparison::Superlist,
        (f, s) if f < s && is_sublist(first_list, second_list) => Comparison::Sublist,
        (s, f) if s > f && is_sublist(second_list, first_list) => Comparison::Superlist,
        (s, f) if s == f && first_list == second_list => Comparison::Equal,
        _ => Comparison::Unequal,
    }
}

fn is_sublist<T: PartialEq>(first_list: &[T], second_list: &[T]) -> bool {
    second_list
        .windows(first_list.len())
        .any(|window| window == first_list)
}
