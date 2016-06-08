class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present? 
  end

  def default_url_options(options={})
      {:locale => I18n.locale}
  end

  def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:account_update) do |user_params|
	    user_params.permit(:name, :phone_no, :email, :current_password)
	  end
	  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
	    user_params.permit(:name, :phone_no, :email, :password)
	  end
  end
end
