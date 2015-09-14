class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  def city
    City.find_by_slug!(city_id)
  end
  helper_method :city
  def city_id
  	params[:city_id]
  end
end
