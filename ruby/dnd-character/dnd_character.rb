# frozen_string_literal: true

class DndCharacter
  BASE_HITPOINTS = 10

  def self.modifier(constitution)
    (constitution - 10) / 2
  end

  attr_accessor :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma

  def initialize
    self.strength = set_attribute
    self.dexterity = set_attribute
    self.constitution = set_attribute
    self.intelligence = set_attribute
    self.wisdom = set_attribute
    self.charisma = set_attribute
  end

  def hitpoints
    @hitpoints ||= BASE_HITPOINTS + self.class.modifier(constitution)
  end

  private

  def set_attribute
    (1..4).map { rand(1..6) }.sort.slice(0, 3).sum
  end
end
