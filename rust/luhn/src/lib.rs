/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    let mut sum = 0;
    let len = code.trim().len();

    const RADIX: u32 = 10;

    for (i, c) in code.chars().rev().filter(|&c| c != ' ').enumerate() {
        match (i % 2, c.to_digit(RADIX)) {
            (1, Some(x)) => {
                let mut temp = x * 2;

                if temp > 9 {
                    temp -= 9;
                }

                sum += temp;
            }
            (0, Some(x)) => sum += x,
            (_, _) => return false,
        }
    }

    (len > 1) && (sum % 10 == 0)
}
