class ProfileController < ApplicationController
  def show
  	@hide_city_menu = true
    @cat_menu_alt = true
  	@cities = City.all
  	@user = User.find(params[:id]) 
  end
end
