class Lasagna
  EXPECTED_MINUTES_IN_OVEN = 40

  def remaining_minutes_in_oven(actual_minutes_in_oven)
    if actual_minutes_in_oven > Lasagna::EXPECTED_MINUTES_IN_OVEN
      0
    else
      Lasagna::EXPECTED_MINUTES_IN_OVEN - actual_minutes_in_oven
    end
  end

  def preparation_time_in_minutes(layers)
    layers * preparation_time_per_layer    
  end

  def total_time_in_minutes(number_of_layers:, actual_minutes_in_oven:)
    preparation_time_in_minutes(number_of_layers) + actual_minutes_in_oven
  end

  private

  def preparation_time_per_layer
    2
  end
end
