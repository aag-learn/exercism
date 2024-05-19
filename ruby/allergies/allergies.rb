class Allergies
  ALLERGENS = {
    eggs: 1,
    peanuts: 2,
    shellfish: 4,
    strawberries: 8,
    tomatoes: 16,
    chocolate: 32,
    pollen: 64,
    cats: 128
  }.freeze

  attr_reader :score

  def initialize(score)
    @score = score
  end

  def allergic_to?(allergen)
    score & ALLERGENS[allergen.to_sym] != 0
  end

  def list
    ALLERGENS.keys.select { allergic_to? _1 }.map(&:to_s)
  end
end
