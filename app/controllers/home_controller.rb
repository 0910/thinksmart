class HomeController < ApplicationController
  def index
  	@projects = Project.all.reverse_order
  	@posts = Post.all.reverse_order
  end
end
