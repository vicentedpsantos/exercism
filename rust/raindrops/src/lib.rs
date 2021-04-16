use std::collections::HashMap;

pub fn raindrops(n: u32) -> String {
    let sounds: HashMap<u32, String> = vec![
        (3, "Pling".to_string()),
        (5, "Plang".to_string()),
        (7, "Plong".to_string()),
    ]
    .into_iter()
    .collect();

    let factors: Vec<u32> = factors_of(n);

    build_result(factors, n, sounds)
}

pub fn factors_of(n: u32) -> Vec<u32> {
    (1..=n)
        .into_iter()
        .filter(|&x| n % x == 0)
        .collect::<Vec<u32>>()
}

pub fn build_result(factors: Vec<u32>, n: u32, sounds: HashMap<u32, String>) -> String {
    let sounds_a: Vec<String> = factors
        .into_iter()
        .map(|x| match sounds.get(&x) {
            Some(res) => res.to_string(),
            None => "".to_string(),
        })
        .collect();

    if sounds_a.join("") == "" {
        return n.to_string();
    } else {
        return sounds_a.join("");
    };
}
