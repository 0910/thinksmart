class PostsController < ApplicationController
  def index
    @posts = Post.all.reverse_order
  end
  def show
  	@post = Post.friendly.find(params[:id])
    @posts = Post.joins(:project_posts).where(:project_posts => {:proyect_id => @proyect})
    @previous = Post.where("id < ?", params[:id]).order(:id).first   
    @next = Post.where("id > ?", params[:id]).order(:id).first
    @categories = Category.all 
  end
  def transport
    @transport = true
  	@posts = Post.where('category_id = 1').where.not('priority_id = 3')
    @posts_home = Post.all.reverse_order.where('category_id = 1').where('priority_id = 3')
  	render :index
  end
  def development
    @development = true
  	@posts = Post.where('category_id = 2').where.not('priority_id = 3')
    @posts_home = Post.all.reverse_order.where('category_id = 2').where('priority_id = 3')
  	render :index
  end
  def environment
    @environment = true
  	@posts = Post.where('category_id = 3').where.not('priority_id = 3')
    @posts_home = Post.all.reverse_order.where('category_id = 3').where('priority_id = 3')
  	render :index
  end
  def people
    @people = true
  	@posts = Post.where('category_id = 4').where.not('priority_id = 3')
    @posts_home = Post.all.reverse_order.where('category_id = 4').where('priority_id = 3')
  	render :index
  end
  def community
    @community = true
  	@posts = Post.where('category_id = 5').where.not('priority_id = 3')
    @posts_home = Post.all.reverse_order.where('category_id = 5').where('priority_id = 3')
  	render :index
  end
  def innovation
    @innovation = true
  	@posts = Post.where('category_id = 6').where.not('priority_id = 3')
    @posts_home = Post.all.reverse_order.where('category_id = 6').where('priority_id = 3')
  	render :index
  end
end
