module Acronym
    def self.abbreviate phrase
        phrase.split(/[\s-]+/).sum(''){|word| word[0].upcase}
    end
end
