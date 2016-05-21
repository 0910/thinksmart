class CitiesController < ApplicationController
  def index
  	@cities = City.all
  end
  def show
    @cat_menu_alt = true
    @cities = City.all
    @categories = Category.all
    @projects_home = city.projects.reverse_order.where('priority_id = 3')
    @projects = city.projects.reverse_order.where('priority_id = 2')
    @posts_home = city.posts.reverse_order.where('priority_id = 3')
    @posts = city.posts.reverse_order.where('priority_id = 2')
  end
  def transport
    @transport = true
    @projects_home = city.projects.reverse_order.where(priority_id: 3, category: 1)
    @posts_home = city.posts.reverse_order.where(priority_id: 3, category: 1)
    @projects = city.projects.reverse_order.where(priority_id: 2, category: 1)
    @posts = city.posts.reverse_order.where(priority_id: 2, category: 1)
    @cities = City.all
    render :show
  end
  def development
    @development = true
    @projects_home = city.projects.reverse_order.where(priority_id: 3, category: 2)
    @posts_home = city.posts.reverse_order.where(priority_id: 3, category: 2)
    @projects = city.projects.reverse_order.where(priority_id: 2, category: 2)
    @posts = city.posts.reverse_order.where(priority_id: 2, category: 2)
    render :show
  end
  def environment
    @environment = true
    @projects_home = city.projects.reverse_order.where(priority_id: 3, category: 3)
    @posts_home = city.posts.reverse_order.where(priority_id: 3, category: 3)
    @projects = city.projects.reverse_order.where(priority_id: 2, category: 3)
    @posts = city.posts.reverse_order.where(priority_id: 2, category: 3)
    render :show
  end
  def people
    @people = true
    @projects_home = city.projects.reverse_order.where(priority_id: 3, category: 4)
    @posts_home = city.posts.reverse_order.where(priority_id: 3, category: 4)
    @projects = city.projects.reverse_order.where(priority_id: 2, category: 4)
    @posts = city.posts.reverse_order.where(priority_id: 2, category: 4)
    render :show
  end
  def community
    @community = true
    @projects_home = city.projects.reverse_order.where(priority_id: 3, category: 5)
    @posts_home = city.posts.reverse_order.where(priority_id: 3, category: 5)
    @projects = city.projects.reverse_order.where(priority_id: 2, category: 5)
    @posts = city.posts.reverse_order.where(priority_id: 2, category: 5)
    render :show
  end
  def innovation
    @innovation = true
    @projects_home = city.projects.reverse_order.where(priority_id: 3, category: 6)
    @posts_home = city.posts.reverse_order.where(priority_id: 3, category: 6)
    @projects = city.projects.reverse_order.where(priority_id: 2, category: 6)
    @posts = city.posts.reverse_order.where(priority_id: 2, category: 6)
    render :show
  end
  def city_id
    params[:id]
  end
end
