class ProjectsController < ApplicationController
  def index
  	@projects = Project.all.reverse_order
  end
  def show
  	@project = Project.find(params[:id])
  end
  def transport
  	@projects = city.projects.where('category_id = 1')
  	render :index
  end
  def development
  	@projects = Project.where('category_id = 2')
  	render :index
  end
  def environment
  	@projects = Project.where('category_id = 3')
  	render :index
  end
  def people
  	@projects = Project.where('category_id = 4')
  	render :index
  end
  def community
  	@projects = Project.where('category_id = 5')
  	render :index
  end
  def innovation
  	@projects = Project.where('category_id = 6')
  	render :index
  end
end
