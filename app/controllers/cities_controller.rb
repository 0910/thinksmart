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
    @projects_home = city.projects.reverse_order.where('priority_id = 3')
    @projects_section = city.projects.reverse_order.where('priority_id = 2')
    @projects_normal = city.projects.reverse_order.where('priority_id = 1')
  	@posts = city.posts.all.reverse_order
    @posts = @posts.category_id(params[:category_id]) if params[:category_id].present?
    @posts_home = city.posts.reverse_order.where('priority_id = 3')
    @posts_section = city.posts.reverse_order.where('priority_id = 2')
    @posts_normal = city.posts.reverse_order.where('priority_id = 1')
  end
  def city_id
    params[:id]
  end
end
