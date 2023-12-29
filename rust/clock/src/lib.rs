use std::fmt::Display;

const MINUTES_IN_CLOCK: i32 = 24 * 60;
#[derive(Debug, PartialEq)]
pub struct Clock {
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Self {
            minutes: (hours * 60 + minutes).rem_euclid(MINUTES_IN_CLOCK),
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Self {
            minutes: (self.minutes + minutes).rem_euclid(MINUTES_IN_CLOCK),
        }
    }

    fn hours(&self) -> i32 {
        self.minutes / 60
    }

    fn display_minutes(&self) -> i32 {
        self.minutes - self.hours() * 60
    }
}

impl Display for Clock {
    fn fmt(&self, fmt: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(fmt, "{:0>2}:{:0>2}", self.hours(), self.display_minutes())
    }
}
