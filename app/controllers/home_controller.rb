class HomeController < ApplicationController
  def index
  	@projects = Project.all
  	@posts = Post.all
  end
end
