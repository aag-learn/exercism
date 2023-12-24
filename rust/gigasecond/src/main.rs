use gigasecond::{self, after};
use time::{Date, PrimitiveDateTime as DateTime, Time};

fn main() {
    let start = dt(2011, 4, 25, 0, 0, 0);
    let start_after = after(start);
    println!("{}", start);
    println!("{}", start_after);
}

fn dt(year: i32, month: u8, day: u8, hour: u8, minute: u8, second: u8) -> DateTime {
    DateTime::new(
        Date::from_calendar_date(year, month.try_into().unwrap(), day).unwrap(),
        Time::from_hms(hour, minute, second).unwrap(),
    )
}
