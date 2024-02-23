use std::collections::HashMap;

pub struct CodonsInfo<'a> {
    map: HashMap<&'a str, &'a str>,
}

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

        let mut cursor = 3;

        loop {
            match self.name_for(&rna[cursor - 3..cursor]) {
                Some(protein) => {
                    if protein == "stop codon" {
                        break;
                    } else {
                        result.push(protein);
                    }

                    match rna.len() - cursor {
                        n if n == 0 => break,      // End of rna string reached
                        n if n < 3 => return None, // Wrong length!!
                        _ => cursor += 3,          // Continue processing...
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
