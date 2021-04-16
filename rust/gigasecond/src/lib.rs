use chrono::{DateTime, Duration, Utc};

// Returns a Utc DateTime one billion seconds after start.
pub fn after(start: DateTime<Utc>) -> DateTime<Utc> {
    let gigasecond = Duration::seconds(1_000_000_000);

    start.checked_add_signed(gigasecond).unwrap()
}
