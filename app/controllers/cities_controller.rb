class CitiesController < ApplicationController
  def index
    @hide_city_menu = true
  	@cities = City.all
  end
  def show
    @cities = City.all
  	@projects = city.projects.all.reverse_order
  	@posts = city.posts.all.reverse_order
  end
  def city_id
    params[:id]
  end
end
