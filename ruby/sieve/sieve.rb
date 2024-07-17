# frozen_string_literal: true

class Sieve
  def initialize(number)
    @number = number
  end

  def primes
    test = (0..@number).to_a
    primes = []
    (2..@number).each do |index|
      next if test[index].zero?

      primes.push index
      cursor = 1
      while cursor <= @number
        test[cursor * index] = 0
        cursor += 1
      end
    end
    primes
  end
end
