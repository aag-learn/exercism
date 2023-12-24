use time::{Duration, PrimitiveDateTime as DateTime};

const GIGASECOND: i64 = 1000000000;

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    //todo!("What time is a gigasecond later than {start}");
    start + Duration::seconds(GIGASECOND)
}
