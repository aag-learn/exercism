pub struct HighScores<'a> {
    scores: &'a [u32],
}

impl<'a> HighScores<'a> {
    pub fn scores(&self) -> &'a [u32] {
        self.scores
    }
    pub fn new(scores: &'a [u32]) -> Self {
        Self { scores }
    }

    pub fn latest(&self) -> Option<u32> {
        self.scores.last().cloned()
    }

    pub fn personal_best(&self) -> Option<u32> {
        self.scores.iter().max().copied()
    }

    pub fn personal_top_three(&self) -> Vec<u32> {
        let mut data = Vec::from(self.scores);
        data.sort();
        data.iter().rev().take(3).cloned().collect()
    }
}
