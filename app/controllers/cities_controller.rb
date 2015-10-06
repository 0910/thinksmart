class CitiesController < ApplicationController
  def index
    @hide_city_menu = true
    @cat_menu_alt = true
  	@cities = City.all
  end
  def show
    @cat_menu_alt = true
    @cities = City.all
  	@projects = city.projects.all.reverse_order
    @projects = @projects.category_id(params[:category_id]) if params[:category_id].present?
  	@posts = city.posts.all.reverse_order
    @posts = @posts.category_id(params[:category_id]) if params[:category_id].present?
  end
  def city_id
    params[:id]
  end
end
