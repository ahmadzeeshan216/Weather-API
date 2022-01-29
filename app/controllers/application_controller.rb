class ApplicationController < ActionController::API
  before_action :format_params
  before_action :set_language

  protected

  def format_params
    params[:locale] = 'en' unless params[:locale].present?
  end

  def set_language
    I18n.locale = params[:locale].to_s
  end

  def symbolized_action_name
    action_name.to_sym
  end
end
