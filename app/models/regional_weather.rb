class RegionalWeather
  attr_reader :temperature, :wind, :clouds

  def initialize(temperature: nil, wind: nil, clouds: nil)
    @temperature = temperature
    @wind = wind
    @clouds = clouds
  end

  def temperature_details
    if temperature < 0
      I18n.t('temperature.below_zero', degrees: temperature.abs)
    else
      I18n.t('temperature.above_zero', degrees: temperature)
    end
  end

  def wind_details
    if wind < 3
      I18n.t('wind.none')
    elsif wind < 8
      I18n.t('wind.weak')
    elsif wind < 20
      I18n.t('wind.medium')
    else
      I18n.t('wind.strong')
    end
  end

  def clouds_details
    if clouds <= 10
      I18n.t('clouds.none')
    elsif clouds <= 70
      I18n.t('clouds.partial')
    else
      I18n.t('clouds.full')
    end
  end
end
