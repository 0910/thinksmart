class HomeController < ApplicationController
  def index
    @cities = City.all
    @projects_home = Project.all.reverse_order.where(priority_id: 3)
    @posts_home = Post.all.reverse_order.where(priority_id: 3)
  	#if coords = request.location.try(:coords)
  	#	if city = City.near(coords, 20).first
  	#		return redirect_to(city_path(city))
  	#	end
  	#end
  	#redirect_to(cities_path)
  end
  def transport
    @cities = City.all
    @projects_home = Project.all.reverse_order.where(priority_id: 3, category: 1)
    @posts_home = Post.all.reverse_order.where(priority_id: 3, category: 1)
    render :index
  end
  def development
    @cities = City.all
    @projects_home = Project.all.reverse_order.where(priority_id: 3, category: 2)
    @posts_home = Post.all.reverse_order.where(priority_id: 3, category: 2)
    render :index
  end
  def environment
    @cities = City.all
    @projects_home = Project.all.reverse_order.where(priority_id: 3, category: 3)
    @posts_home = Post.all.reverse_order.where(priority_id: 3, category: 3)
    render :index
  end
  def people
    @cities = City.all
    @projects_home = Project.all.reverse_order.where(priority_id: 3, category: 4)
    @posts_home = Post.all.reverse_order.where(priority_id: 3, category: 4)
    render :index
  end
  def community
    @cities = City.all
    @projects_home = Project.all.reverse_order.where(priority_id: 3, category: 5)
    @posts_home = Post.all.reverse_order.where(priority_id: 3, category: 5)
    render :index
  end
  def innovation
    @cities = City.all
    @projects_home = Project.all.reverse_order.where(priority_id: 3, category: 6)
    @posts_home = Post.all.reverse_order.where(priority_id: 3, category: 6)
    render :index
  end
end
