# frozen_string_literal: true

module Blackjack
  CARDS = {
    ace: 11,
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9,
    ten: 10,
    jack: 10,
    queen: 10,
    king: 10
  }
  def self.parse_card(card)
    CARDS[card.to_sym] || 0
  end

  def self.card_range(card1, card2)
    sum = CARDS[card1.to_sym] + CARDS[card2.to_sym]
    case sum
    when (4..11) then 'low'
    when (12..16) then 'mid'
    when (17..20) then 'high'
    when 21 then 'blackjack'
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    return 'P' if card1 == 'ace' && card2 == 'ace'

    case card_range(card1, card2)
    when 'blackjack'
      parse_card(dealer_card) < 10 ? 'W' : 'S'
    when 'high'
      'S'
    when 'mid'
      parse_card(dealer_card) < 7 ? 'S' : 'H'
    when 'low'
      'H'
    end
  end
end
