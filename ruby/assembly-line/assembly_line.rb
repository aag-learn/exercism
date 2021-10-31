class AssemblyLine
  RATE_PER_HOUR = 221
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    RATE_PER_HOUR * @speed * success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end

  private

  def base_rate_per_hour
    RATE_PER_HOUR * @speed
  end

  def success_rate
    case @speed
      when 1..4 then 1
      when 5..8 then 0.9
      when 9 then 0.8
      else 0.77
    end
  end
end
