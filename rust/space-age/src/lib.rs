// The code below is a stub. Just enough to satisfy the compiler.
// In order to pass the tests you can add-to or change any of this code.

pub struct Duration {
    seconds: f64,
    _secret: (),
}

impl Duration {
    fn new(seconds: f64) -> Self {
        Self {
            seconds,
            _secret: (),
        }
    }
}

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Self::new(s as f64)
    }
}

pub trait Planet {
    fn base() -> bool {
        false
    }

    fn orbital_period() -> f64 {
        unimplemented!()
    }

    fn years_during(d: &Duration) -> f64 {
        let base_result: f64 = d.seconds / 60. / 60. / 24. / Earth::orbital_period();

        match Self::base() {
            true => base_result,
            _ => base_result / Self::orbital_period(),
        }
    }
}

pub struct Mercury;
pub struct Venus;
pub struct Earth;
pub struct Mars;
pub struct Jupiter;
pub struct Saturn;
pub struct Uranus;
pub struct Neptune;

impl Planet for Mercury {
    fn orbital_period() -> f64 {
        0.2408467
    }
}
impl Planet for Venus {
    fn orbital_period() -> f64 {
        0.61519726
    }
}
impl Planet for Earth {
    fn base() -> bool {
        true
    }

    fn orbital_period() -> f64 {
        365.25
    }
}

impl Planet for Mars {
    fn orbital_period() -> f64 {
        1.8808158
    }
}

impl Planet for Jupiter {
    fn orbital_period() -> f64 {
        11.862615
    }
}
impl Planet for Saturn {
    fn orbital_period() -> f64 {
        29.447498
    }
}

impl Planet for Uranus {
    fn orbital_period() -> f64 {
        84.016846
    }
}
impl Planet for Neptune {
    fn orbital_period() -> f64 {
        164.79132
    }
}
