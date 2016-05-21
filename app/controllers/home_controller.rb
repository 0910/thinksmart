class HomeController < ApplicationController
  def index
    @splashes = Splash.all
    @cities = City.all
    @projects_home = Project.all.reverse_order.where(priority_id: 3)
    @posts_home = Post.all.reverse_order.where(priority_id: 3)
    @categories = Category.all
  	#if coords = request.location.try(:coords)
  	#	if city = City.near(coords, 20).first
  	#		return redirect_to(city_path(city))
  	#	end
  	#end
  	#redirect_to(cities_path)
  end
  def transport
    @transport = true
    @projects_home = Project.all.reverse_order.where(priority_id: 3, category: 1)
    @posts_home = Post.all.reverse_order.where(priority_id: 3, category: 1)
    render :category
  end
  def development
    @development = true
    @projects_home = Project.all.reverse_order.where(priority_id: 3, category: 2)
    @posts_home = Post.all.reverse_order.where(priority_id: 3, category: 2)
    render :category
  end
  def environment
    @environment = true
    @projects_home = Project.all.reverse_order.where(priority_id: 3, category: 3)
    @posts_home = Post.all.reverse_order.where(priority_id: 3, category: 3)
    render :category
  end
  def people
    @people = true
    @projects_home = Project.all.reverse_order.where(priority_id: 3, category: 4)
    @posts_home = Post.all.reverse_order.where(priority_id: 3, category: 4)
    render :category
  end
  def community
    @community = true
    @projects_home = Project.all.reverse_order.where(priority_id: 3, category: 5)
    @posts_home = Post.all.reverse_order.where(priority_id: 3, category: 5)
    render :category
  end
  def innovation
    @innovation = true
    @projects_home = Project.all.reverse_order.where(priority_id: 3, category: 6)
    @posts_home = Post.all.reverse_order.where(priority_id: 3, category: 6)
    render :category
  end
end
