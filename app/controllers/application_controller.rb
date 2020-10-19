class ApplicationController < ActionController::Base
  before_action :cofigure_permitted_parameters, if: :devise_controller?
    

  private

  def cofigure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :name, :last_name_kana, :name_kana, :birthday])
  
  end
end
