use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let target_word = TargetWord {
        value: &word.to_lowercase(),
    };

    let mut outputs: Vec<&str> = vec![];

    for word in possible_anagrams {
        if target_word.test(&word.to_lowercase()) {
            outputs.push(word);
        }
    }

    outputs.iter().cloned().collect()
}

struct TargetWord<'a> {
    value: &'a str,
}

impl<'a> TargetWord<'a> {
    fn test(&self, word: &str) -> bool {
        if self.is_same_length(&word) && self.is_different(&word) && self.is_anagram(&word) {
            return true;
        }

        false
    }

    fn is_different(&self, word: &str) -> bool {
        !self.value.eq_ignore_ascii_case(word)
    }

    fn is_same_length(&self, word: &str) -> bool {
        self.value.len() == word.len()
    }

    fn is_anagram(&self, word: &str) -> bool {
        let mut self_chars: Vec<char> = self.value.chars().collect();
        self_chars.sort_unstable();

        let mut incoming_chars: Vec<char> = word.chars().collect();
        incoming_chars.sort_unstable();

        self_chars == incoming_chars
    }
}
