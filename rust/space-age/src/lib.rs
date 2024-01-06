// The code below is a stub. Just enough to satisfy the compiler.
// In order to pass the tests you can add-to or change any of this code.
const EARTH_ORBITAL_PERIOD: f64 = 31557600.;

#[derive(Debug)]
pub struct Duration {
    seconds: u64,
}

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Self { seconds: s }
    }
}

macro_rules! planet {
    ($name:ident, $relative_period:literal) => {
        #[derive(Debug)]
        pub struct $name {}
        impl $name {
            pub fn years_during(d: &Duration) -> f64 {
                d.seconds as f64 / (EARTH_ORBITAL_PERIOD * $relative_period)
            }
        }
    };
}
planet!(Earth, 1.0);
planet!(Mercury, 0.2408467);
planet!(Venus, 0.61519726);
planet!(Mars, 1.8808158);
planet!(Jupiter, 11.862615);
planet!(Saturn, 29.447498);
planet!(Uranus, 84.016846);
planet!(Neptune, 164.79132);
