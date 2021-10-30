require 'date' 
class Meetup
  @@dow = {
    0 => :sunday,
    1 => :monday,
    2 => :tuesday,
    3 => :wednesday,
    4 => :thursday,
    5 => :friday,
    6 => :saturday
  }
  attr_reader :day_of_week, :descriptor, :month, :year
  
  def initialize month, year
    @month = month
    @year  = year
  end
  def day day_of_week, descriptor
    @descriptor  = descriptor
    @day_of_week = day_of_week
    case descriptor
      when :teenth then day_with_teenth_descriptor
      else day_with_position_descriptor
    end
  end
  private
  def day_with_teenth_descriptor
    day = (13..19).find do |day|
      @@dow[Date.new(@year, @month, day).wday] == day_of_week
    end  
    Date.new(@year, @month, day)
  end
  def day_with_position_descriptor
    aux_month = @month
    cursor = Date.new(@year, @month, 1)
    days = []
    while(aux_month == @month) 
      days.push cursor if @@dow[cursor.wday] == @day_of_week
      cursor = cursor.next
      aux_month = cursor.month
    end
    case @descriptor
      when :last then days.last
      when :first then days[0]
      when :second then days [1]
      when :third then days[2]
      when :fourth then days[3]
    end
  end
end