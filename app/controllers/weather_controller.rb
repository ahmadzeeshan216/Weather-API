class WeatherController < ApplicationController
  include Weather::Constants

  before_action :format_params
  before_action :validate_params
  before_action :set_language

  def temperature
    render json: { description: temperature_description }
  end

  def wind
    render json: { description: wind_description }
  end

  def clouds
    render json: { description: clouds_description }
  end

private

  def validate_params
    render status: :unprocessable_entity unless unit_param.present?
  end

  def unit_param
    @unit_param ||= params[UNIT_PARAM_NAMES[action_name.to_sym]]
  end

  def format_params
    params[:locale] = 'en' unless params[:locale].present?
  end

  def set_language
    I18n.locale = params[:locale].to_s
  end

  def temperature_description
    if unit_param < 0
      I18n.t('temperature.below_zero', degrees: unit_param.abs)
    else
      I18n.t('temperature.above_zero', degrees: unit_param)
    end
  end

  def wind_description
    if unit_param < 3
      I18n.t('wind.none')
    elsif unit_param < 8
      I18n.t('wind.weak')
    elsif unit_param < 20
      I18n.t('wind.medium')
    else
      I18n.t('wind.strong')
    end
  end

  def clouds_description
    if unit_param <= 10
      I18n.t('clouds.none')
    elsif unit_param <= 70
      I18n.t('clouds.partial')
    else
      I18n.t('clouds.full')
    end
  end
end
