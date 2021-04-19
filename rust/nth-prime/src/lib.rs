pub fn nth(n: u32) -> u32 {
    ((2 as u32)..)
        .filter(|m| is_prime(*m))
        .nth(n as usize)
        .unwrap()
}

pub fn is_prime(number: u32) -> bool {
    if number <= 1 {
        return false;
    }

    let mut i = 2;

    while i * i <= number {
        if number % i == 0 {
            return false;
        }

        i += 1;
    }

    true
}
