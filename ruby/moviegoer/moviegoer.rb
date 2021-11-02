# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  FULL_PRICE    = 15
  REDUCED_PRICE = 10
  SENIOR_AGE    = 60
  ADULT_AGE     = 18

  attr_reader :age, :member

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    age >= SENIOR_AGE ? REDUCED_PRICE : FULL_PRICE
  end

  def watch_scary_movie?
    age >= ADULT_AGE
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    member ? "🍿" : (raise NotMovieClubMemberError.new)
  end
end
