class HomeController < ApplicationController
  def index
  	if coords = request.location.try(:coords)
  		if city = City.near(coords, 20).first
  			return redirect_to(city_path(city))
  		end
  	end
  	redirect_to(cities_path)
  end
end
