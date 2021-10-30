# Second solution, much cleaner after looking at the solutions 
# shared by other people
require 'date' 

class Meetup
  @@offset = {
    first: 1,
    second: 8,
    third: 15,
    fourth: 22,
    teenth: 13,
    last: -7
  }
  
  attr_reader :month, :year
  
  def initialize month, year
    @month = month
    @year  = year
  end

  def day day_of_week, descriptor
    date = Date.new(@year, @month, @@offset[descriptor])
    date = date.next until date.send("#{day_of_week}?")
    date
  end
end
