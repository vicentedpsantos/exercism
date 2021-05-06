use regex::Regex;

/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    let code = CardString::new(code);

    code.is_valid()
}

struct CardString {
    value: String,
    _secret: (),
}

impl CardString {
    fn new(code: &str) -> Self {
        let whitespacesre = Regex::new(r"\s").unwrap();
        let value = whitespacesre.replace_all(code, "");

        Self {
            value: value.to_string(),
            _secret: (),
        }
    }

    fn is_valid(&self) -> bool {
        let non_digitre = Regex::new(r"\D").unwrap();
        let non_digits = match non_digitre.find(&self.value) {
            Some(x) => x.as_str(),
            None => "",
        };

        self.value.len() > 1 && non_digits.len() == 0 && self.is_luhn()
    }

    fn is_luhn(&self) -> bool {
        (self.luhn_sum() % 10) == 0
    }

    fn luhn_sum(&self) -> i32 {
        let intgs: Vec<i32> = self
            .value
            .chars()
            .rev()
            .map(|x| x.to_string().parse::<i32>().unwrap())
            .collect();

        let mut res_list: Vec<i32> = Vec::new();

        for (i, v) in intgs.iter().enumerate() {
            let mut res: i32 = *v;

            if i % 2 != 0 {
                res = 2 * v;

                if res > 9 {
                    res = res - 9
                }
            }

            res_list.push(res)
        }

        let result = res_list.iter().sum();

        result
    }
}
