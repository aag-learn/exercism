class HighScores

    attr_reader :scores
    
    def initialize scores
        self.scores = scores
        self.sorted_scores = scores.sort{|a,b| b<=>a}
    end

    def latest
        scores.last
    end

    def personal_best
        scores.max
    end

    def personal_top_three
        sorted_scores.length > 3 ? sorted_scores[0..2]  :  sorted_scores 
    end

    def latest_is_personal_best?
        personal_best == latest
    end

    private

    attr_writer :scores
    attr_accessor :sorted_scores
end
