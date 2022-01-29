class WeatherController < ApplicationController
  include Weather::Constants

  before_action :validate_params
  before_action :set_weather

  def temperature
    render json: { description: @weather.temperature_details }
  end

  def wind
    render json: { description: @weather.wind_details }
  end

  def clouds
    render json: { description: @weather.clouds_details }
  end

private

  def validate_params
    render status: :unprocessable_entity unless unit_param_value.present?
  end

  def set_weather
    @weather = RegionalWeather.new(symbolized_action_name => unit_param_value)
  end

  def unit_param_value
    @unit_param ||= params[UNIT_PARAM_NAMES[symbolized_action_name]]
  end
end
