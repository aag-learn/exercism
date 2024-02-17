use std::collections::HashMap;
use std::fmt::{Display, Formatter, Result};

pub struct Roman {
    decimal: u32,
}

impl Display for Roman {
    fn fmt(&self, _f: &mut Formatter<'_>) -> Result {
        write!(_f, "{}", Roman::convert_recursively(self.decimal))
    }
}

impl Roman {
    fn my_maps_and_loops(&self) -> String {
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
        string
    }

    fn better_maps_and_loops(&self) -> String {
        let mut n = self.decimal;
        let roman_literals = Roman::get_roman_literals();
        let mut keys: Vec<&u32> = roman_literals.keys().collect();
        keys.sort();
        keys.iter().rev().fold("".to_string(), |acc, &decimal| {
            let roman = roman_literals[decimal];
            println!("Trying {decimal} ({roman})");
            let mut result = acc;
            while n >= *decimal {
                println!("{result} - {n} - {decimal}");
                result += roman;
                n -= decimal;
            }
            result
        })
    }

    fn get_roman_literals<'a>() -> HashMap<u32, &'a str> {
        HashMap::from([
            (1000, "M"),
            (900, "CM"),
            (500, "D"),
            (400, "CD"),
            (100, "C"),
            (90, "XC"),
            (50, "L"),
            (40, "XL"),
            (10, "X"),
            (9, "IX"),
            (5, "V"),
            (4, "IV"),
            (1, "I"),
        ])
    }

    fn convert_recursively(decimal: u32) -> String {
        match decimal {
            n if n >= 1000 => format!("M{}", Roman::convert_recursively(decimal - 1000)),
            n if n >= 900 => format!("CM{}", Roman::convert_recursively(decimal - 900)),
            n if n >= 500 => format!("D{}", Roman::convert_recursively(decimal - 500)),
            n if n >= 400 => format!("CD{}", Roman::convert_recursively(decimal - 400)),
            n if n >= 100 => format!("C{}", Roman::convert_recursively(decimal - 100)),
            n if n >= 90 => format!("XC{}", Roman::convert_recursively(decimal - 90)),
            n if n >= 50 => format!("L{}", Roman::convert_recursively(decimal - 50)),
            n if n >= 40 => format!("XL{}", Roman::convert_recursively(decimal - 40)),
            n if n >= 10 => format!("X{}", Roman::convert_recursively(decimal - 10)),
            n if n >= 9 => format!("IX{}", Roman::convert_recursively(decimal - 9)),
            n if n >= 5 => format!("V{}", Roman::convert_recursively(decimal - 5)),
            n if n >= 4 => format!("IV{}", Roman::convert_recursively(decimal - 4)),
            n if n >= 1 => format!("I{}", Roman::convert_recursively(decimal - 1)),
            _ => String::from(""),
        }
    }
    fn get_roman_character(num: u32) -> Option<String> {
        match num {
            1000 => Some(String::from("M")),
            900 => Some(String::from("CM")),
            500 => Some(String::from("D")),
            400 => Some(String::from("CD")),
            100 => Some(String::from("C")),
            90 => Some(String::from("XC")),
            50 => Some(String::from("L")),
            40 => Some(String::from("XL")),
            10 => Some(String::from("X")),
            9 => Some(String::from("IX")),
            5 => Some(String::from("V")),
            4 => Some(String::from("IV")),
            1 => Some(String::from("I")),
            _ => None,
        }
    }

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
