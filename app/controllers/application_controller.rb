class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  # Create a resource method to access registration via modal from any controller
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  helper_method :resource, :resource_name, :devise_mapping

  # Add some custom behaviour to devise registration

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |g| g.permit(:email, :password, :password_confirmation, :name, :genre_id, :target_id, {:interest_ids => []} )}
    devise_parameter_sanitizer.for(:account_update) { |g| g.permit(:email, :current_password, :password, :password_confirmation, :name, :genre_id, :target_id, {:interest_ids => []} )}
  end

  def city
    City.find_by_slug!(city_id) if city_id.present?
  end
  helper_method :city
  def city_id
  	params[:city_id]
  end
end
