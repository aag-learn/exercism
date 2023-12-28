use std::fmt::Display;

#[derive(Debug, PartialEq)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let clock = Self { hours, minutes: 0 };
        clock.add_minutes(minutes)
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let extra_hours = (self.minutes + minutes) / 60;
        let mut clock_hours = (self.hours + extra_hours).rem_euclid(24);
        let reminder_minutes = self.minutes + minutes - extra_hours * 60;
        let clock_minutes = reminder_minutes.rem_euclid(60);
        if reminder_minutes < 0 {
            if clock_hours == 0 {
                clock_hours = 23;
            } else {
                clock_hours -= 1;
            }
        }
        Self {
            minutes: clock_minutes,
            hours: clock_hours,
        }
    }
}

impl Display for Clock {
    fn fmt(&self, fmt: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(fmt, "{:0>2}:{:0>2}", self.hours, self.minutes)
    }
}
