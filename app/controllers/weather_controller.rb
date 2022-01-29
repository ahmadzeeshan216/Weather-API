class WeatherController < ApplicationController
  include Weather::Constants

  before_action :format_params
  before_action :validate_params
  before_action :set_language
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

  def set_weather
    @weather = RegionalWeather.new(symbolized_action_name => unit_param_value)
  end

  def validate_params
    render status: :unprocessable_entity unless unit_param_value.present?
  end

  def unit_param_value
    @unit_param ||= params[UNIT_PARAM_NAMES[symbolized_action_name]]
  end

  def format_params
    params[:locale] = 'en' unless params[:locale].present?
  end

  def set_language
    I18n.locale = params[:locale].to_s
  end
end
