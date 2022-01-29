module Weather
  module Constants
    extend ActiveSupport::Concern

    UNIT_PARAM_NAMES = {
      temperature: :degrees,
      wind: :wind_speed,
      clouds: :clouds
    }
  end
end
