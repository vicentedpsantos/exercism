use {
    chrono::{naive::NaiveTime, Duration},
    std::{convert::TryFrom, fmt, num::ParseIntError, ops::Add},
};

#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Clock {
    time: NaiveTime,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let mut hours = hours + minutes / 60;
        if minutes < 0 && minutes % 60 != 0 {
            hours -= 1;
        }
        hours = hours.rem_euclid(24);
        let minutes = minutes.rem_euclid(60);

        Self {
            time: NaiveTime::from_hms(hours as u32, minutes as u32, 0),
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Self {
            time: self.time.add(Duration::minutes(minutes as i64)),
        }
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.time.format("%H:%M"))
    }
}

impl TryFrom<&str> for Clock {
    type Error = String;

    fn try_from(time: &str) -> Result<Self, Self::Error> {
        let hhmm: Vec<&str> = time.split(':').collect();

        if is_valid_time(&hhmm) {
            Ok(parse_string_to_clock(hhmm))
        } else {
            Err("invalid time".to_owned())
        }
    }
}

fn is_valid_time(hhmm: &Vec<&str>) -> bool {
    hhmm.len() == 2 && hhmm[0].len() == 2 && hhmm[1].len() == 2
}

fn parse_string_to_clock(time_string: Vec<&str>) -> Clock {
    let hh: u32 = time_string[0]
        .parse()
        .map_err(|e: ParseIntError| e.to_string())
        .unwrap();
    let mm: u32 = time_string[1]
        .parse()
        .map_err(|e: ParseIntError| e.to_string())
        .unwrap();

    Clock::new(hh as i32, mm as i32)
}
