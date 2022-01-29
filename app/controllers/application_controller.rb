class ApplicationController < ActionController::API

  protected

  def symbolized_action_name
    action_name.to_sym
  end
end
