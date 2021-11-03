class HighScores

    attr_reader :latest, :personal_best, :personal_top_three, :scores
    
    def initialize scores
        @scores = scores
        @latest = scores.last
        @personal_top_three = scores.max(3)
        @personal_best = @personal_top_three.first
    end

    def latest_is_personal_best?
        personal_best == latest
    end
end
