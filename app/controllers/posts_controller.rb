class PostsController < ApplicationController
  def index
  	@posts = Post.all.reverse_order
  end
  def show
  	@post = Post.find(params[:id])
  end
  def transport
  	@posts = city.posts.where('category_id = 1')
  	render :index
  end
  def development
  	@posts = city.posts.where('category_id = 2')
  	render :index
  end
  def environment
  	@posts = city.posts.where('category_id = 3')
  	render :index
  end
  def people
  	@posts = city.posts.where('category_id = 4')
  	render :index
  end
  def community
  	@posts = city.posts.where('category_id = 5')
  	render :index
  end
  def innovation
  	@posts = city.posts.where('category_id = 6')
  	render :index
  end
end
