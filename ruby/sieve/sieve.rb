# frozen_string_literal: true

class Sieve
  def initialize(number)
    @number = number
  end

  def primes
    primes_iteration_2
  end

  def primes_iteration_1
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

  def primes_iteration_2
    test = (2..@number).to_a
    primes = []
    while test.any?
      number = test.shift
      primes.push number
      test = test.select { |x| (x % number).positive? }
    end
    primes
  end
end
