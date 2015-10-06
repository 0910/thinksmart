class CategoriesController < ApplicationController
  def index
  	@projects = Project.all.reverse_order
  	@posts = Post.all.reverse_order
  	@categories = Category.all
  end
  def show
  	@category = Category.find(params[:id])
  	@projects = city.projects.all
  end
  def transport
  	@projects = city.projects.where('category_id = 1')
  	@posts = city.posts.where('category_id = 1')
  	render :index
  end
  def development
  	@projects = city.projects.where('category_id = 2')
  	@posts = city.posts.where('category_id = 2')
  	render :index
  end
  def environment
  	@projects = city.projects.where('category_id = 3')
  	@posts = city.posts.where('category_id = 3')
  	render :index
  end
  def people
  	@projects = city.projects.where('category_id = 4')
  	@posts = city.posts.where('category_id = 4')
  	render :index
  end
  def community
  	@projects = city.projects.where('category_id = 5')
  	@posts = city.posts.where('category_id = 5')
  	render :index
  end
  def innovation
  	@projects = city.projects.where('category_id = 6')
  	@posts = city.posts.where('category_id = 6')
  	render :index
  end
end
