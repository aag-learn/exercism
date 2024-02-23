use std::collections::HashMap;

pub struct CodonsInfo<'a> {
    map: HashMap<&'a str, &'a str>,
}

const STOP_CODONS: [&str; 3] = ["UAA", "UAG", "UGA"];

impl<'a> CodonsInfo<'a> {
    pub fn name_for(&self, name: &str) -> Option<&'a str> {
        match self.map.get(name) {
            Some(n) => Some(*n),
            None => None,
        }
    }

    pub fn of_rna(&self, rna: &str) -> Option<Vec<&'a str>> {
        if rna.len() < 3 {
            return None;
        }
        let mut result: Vec<&str> = vec![];

        let mut start = 0;
        let mut end = 3;
        loop {
            let codon = &rna[start..end];

            if STOP_CODONS.contains(&codon) {
                break;
            }
            match self.name_for(codon) {
                Some(protein) => {
                    result.push(protein);

                    match rna.len() - end {
                        0 => break,                // End of rna string reached
                        n if n < 3 => return None, // Wrong length!!
                        _ => {
                            start = end;
                            end += 3;
                        }
                    }
                }
                None => return None,
            };
        }
        Some(result)
    }
}

pub fn parse<'a>(pairs: Vec<(&'a str, &'a str)>) -> CodonsInfo<'a> {
    let mut info = CodonsInfo {
        map: HashMap::new(),
    };
    pairs.into_iter().for_each(|(codon, name)| {
        info.map.entry(codon).or_insert(name);
    });
    info
}
