# Using an array instead of a hash to store the allergens
class Allergies
  ALLERGENS = %w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats].freeze

  attr_reader :score

  def initialize(score)
    @score = score.digits(2)
  end

  def allergic_to?(allergen)
    score[ALLERGENS.index(allergen)] == 1
  end

  def list
    ALLERGENS.select { allergic_to? _1 }
  end
end
