class AssemblyLine
  RATE_PER_HOUR = 221
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    if @speed <= 4 
      base_rate_per_hour
    elsif @speed <= 8
      base_rate_per_hour * 0.9
    elsif @speed == 9
      base_rate_per_hour * 0.8
    else
      base_rate_per_hour * 0.77
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end

  private

  def base_rate_per_hour
    RATE_PER_HOUR * @speed
  end
end
