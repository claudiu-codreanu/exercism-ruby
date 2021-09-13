class AssemblyLine
  Cars_Per_Hour = 221

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    rate = @speed * Cars_Per_Hour
    rate = rate.to_f

    case @speed
    when 1..4
      rate
    when 5..8
      rate * 0.9
    when 9
      rate * 0.8
    when 10
      rate * 0.77
    end
  end

  def working_items_per_minute
    production_rate_per_hour.to_i / 60
  end
end
