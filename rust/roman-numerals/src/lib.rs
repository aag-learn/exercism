use std::fmt::{Display, Formatter, Result};

pub struct Roman {
    decimal: u32,
}

impl Display for Roman {
    fn fmt(&self, _f: &mut Formatter<'_>) -> Result {
        let (string, _) = [1000, 100, 10, 1].iter().fold(
            (String::from(""), self.decimal),
            |(text, num), factor| {
                let quotient = num / factor;
                let rest = num - (quotient * factor);
                match Self::multiples_of_ten_to_roman(quotient * factor) {
                    Some(roman) => (format!("{}{}", text, roman), rest),
                    None => (text, rest),
                }
            },
        );
        write!(_f, "{string}")
    }
}

impl Roman {
    fn multiples_of_ten_to_roman(num: u32) -> Option<String> {
        match num {
            3000 => Some(String::from("MMM")),
            2000 => Some(String::from("MM")),
            1000 => Some(String::from("M")),
            900 => Some(String::from("CM")),
            800 => Some(String::from("DCCC")),
            700 => Some(String::from("DCC")),
            600 => Some(String::from("DC")),
            500 => Some(String::from("D")),
            400 => Some(String::from("CD")),
            300 => Some(String::from("CCC")),
            200 => Some(String::from("CC")),
            100 => Some(String::from("C")),
            90 => Some(String::from("XC")),
            80 => Some(String::from("LXXX")),
            70 => Some(String::from("LXX")),
            60 => Some(String::from("LX")),
            50 => Some(String::from("L")),
            40 => Some(String::from("XL")),
            30 => Some(String::from("XXX")),
            20 => Some(String::from("XX")),
            10 => Some(String::from("X")),
            9 => Some(String::from("IX")),
            8 => Some(String::from("VIII")),
            7 => Some(String::from("VII")),
            6 => Some(String::from("VI")),
            5 => Some(String::from("V")),
            4 => Some(String::from("IV")),
            3 => Some(String::from("III")),
            2 => Some(String::from("II")),
            1 => Some(String::from("I")),
            _ => None,
        }
    }
}

impl From<u32> for Roman {
    fn from(num: u32) -> Self {
        Self { decimal: num }
    }
}
