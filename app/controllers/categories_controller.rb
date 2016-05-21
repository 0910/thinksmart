class CategoriesController < ApplicationController
  def show
    @categories = Category.all
  	@category = Category.friendly.find(params[:id])
  	@projects_home = @category.projects.all.reverse_order.where(priority_id: 3)
    @projects = @category.projects.where.not(priority_id: 3)
    @posts_home = @category.posts.all.reverse_order.where(priority_id: 3)
    @posts = @category.posts.where.not(priority_id: 3)
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
