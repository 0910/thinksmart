class ProjectsController < ApplicationController
  def index
  	@projects = Project.all.reverse_order
  end
  def show
  	@project = Project.find(params[:id])
  end
  def transport
    @transport = true
  	@projects = city.projects.where('category_id = 1')
  	render :index
  end
  def development
    @development = true
  	@projects = city.projects.where('category_id = 2')
  	render :index
  end
  def environment
    @environment = true
  	@projects = city.projects.where('category_id = 3')
  	render :index
  end
  def people
    @people = true
  	@projects = city.projects.where('category_id = 4')
  	render :index
  end
  def community
    @community = true
  	@projects = city.projects.where('category_id = 5')
  	render :index
  end
  def innovation
    @innovation = true
  	@projects = city.projects.where('category_id = 6')
  	render :index
  end
end
