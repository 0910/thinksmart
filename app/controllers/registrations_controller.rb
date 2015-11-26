class RegistrationsController < ApplicationController
	def edit
		@hide_city_menu = true
    	@cat_menu_alt = true
  		@cities = City.all
		@user = current_user
	end
end
