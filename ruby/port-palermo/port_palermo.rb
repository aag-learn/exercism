# frozen_string_literal: true

module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city.upcase[0, 4].to_sym
  end

  def self.get_terminal(ship_identifier)
    ship_identifier =~ /OIL|GAS/ ? :A : :B
  end
end
