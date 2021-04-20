use {
    chrono::{naive::NaiveTime, Duration},
    std::{convert::TryFrom, fmt, num::ParseIntError, ops::Add},
};

#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Clock {
    time: NaiveTime,
    _secret: (),
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Self {
            time: NaiveTime::from_hms(0, 0, 0)
                + Duration::hours(hours as i64)
                + Duration::minutes(minutes as i64),
            _secret: (),
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Self {
            time: self.time.add(Duration::minutes(minutes as i64)),
            _secret: (),
        }
    }

    pub fn from_strings(time_string: Vec<&str>) -> Self {
        let hh: u32 = time_string[0]
            .parse()
            .map_err(|e: ParseIntError| e.to_string())
            .unwrap();
        let mm: u32 = time_string[1]
            .parse()
            .map_err(|e: ParseIntError| e.to_string())
            .unwrap();

        Self {
            time: NaiveTime::from_hms(hh as u32, mm as u32, 0),
            _secret: (),
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
            Ok(Clock::from_strings(hhmm))
        } else {
            Err("invalid time".to_owned())
        }
    }
}

fn is_valid_time(hhmm: &Vec<&str>) -> bool {
    hhmm.len() == 2 && hhmm[0].len() == 2 && hhmm[1].len() == 2
}
