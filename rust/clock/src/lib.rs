use std::{fmt::Display, print};

#[derive(Debug)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let mut clock_hours = hours;
        let extra_hours = minutes / 60;
        clock_hours = (clock_hours + extra_hours).rem_euclid(24);
        let reminder_minutes = minutes - extra_hours * 60;
        let clock_minutes = reminder_minutes.rem_euclid(60);
        if reminder_minutes < 0 {
            if clock_hours == 0 {
                clock_hours = 23;
            } else {
                clock_hours -= 1;
            }
        }
        println!("--->> arguments:     {}:{}", hours, minutes);
        println!("--->> extra_hours:   {}", extra_hours);
        println!("--->> clock_hours:   {}", clock_hours);
        println!("--->> clock_minutes: {}", clock_minutes);
        Self {
            minutes: clock_minutes,
            hours: clock_hours,
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let extra_hours = (self.minutes + minutes) / 60;
        let mut clock_hours = (self.hours + extra_hours).rem_euclid(24);
        let reminder_minutes = self.minutes + minutes - extra_hours * 60;
        let clock_minutes = reminder_minutes.rem_euclid(60);
        print!("in add_minutes");
        println!("--->> arguments:     {}", minutes);
        println!("--->> extra_hours:   {}", extra_hours);
        println!("--->> clock_hours:   {}", clock_hours);
        println!("--->> clock_minutes: {}", clock_minutes);
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

impl PartialEq for Clock {
    fn eq(&self, other: &Self) -> bool {
        self.minutes == other.minutes && self.hours == other.hours
    }
}
