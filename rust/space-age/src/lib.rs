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
    const ORBITAL_PERIOD: f64;
    fn years_during(d: &Duration) -> f64;
}

macro_rules! planet {
    ($name:ident, $period:expr) => {
        pub struct $name;
        impl Planet for $name {
            const ORBITAL_PERIOD: f64 = $period;

            fn years_during(d: &Duration) -> f64 {
                d.seconds / Self::ORBITAL_PERIOD / (Earth::YEAR_SECONDS as f64)
            }
        }
    };
}

planet!(Mercury, 0.2408467);
planet!(Venus, 0.61519726);
planet!(Earth, 1.0);
planet!(Mars, 1.8808158);
planet!(Jupiter, 11.862615);
planet!(Saturn, 29.447498);
planet!(Uranus, 84.016846);
planet!(Neptune, 164.79132);

impl Earth {
    pub const YEAR_SECONDS: u64 = 31557600;
}
