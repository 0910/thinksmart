class ProjectsController < ApplicationController
  def index
  	@projects = Project.all.reverse_order.where.not('priority_id = 3')
    @projects_home = Project.all.reverse_order.where('priority_id = 3')
  end
  def show
  	@project = Project.find(params[:id])
    @targets = Target.find(params[:id])
  end
  def transport
    @transport = true
    @projects = city.projects.where('category_id = 1').where.not('priority_id = 3')
    @projects_home = Project.all.reverse_order.where('category_id = 1').where('priority_id = 3')
    render :index
  end
  def development
    @development = true
    @projects = city.projects.where('category_id = 2').where.not('priority_id = 3')
    @projects_home = Project.all.reverse_order.where('category_id = 2').where('priority_id = 3')
    render :index
  end
  def environment
    @environment = true
    @projects = city.projects.where('category_id = 3').where.not('priority_id = 3')
    @projects_home = Project.all.reverse_order.where('category_id = 3').where('priority_id = 3')
    render :index
  end
  def people
    @people = true
    @projects = city.projects.where('category_id = 4').where.not('priority_id = 3')
    @projects_home = Project.all.reverse_order.where('category_id = 4').where('priority_id = 3')
    render :index
  end
  def community
    @community = true
    @projects = city.projects.where('category_id = 5').where.not('priority_id = 3')
    @projects_home = Project.all.reverse_order.where('category_id = 5').where('priority_id = 3')
    render :index
  end
  def innovation
    @innovation = true
    @projects = city.projects.where('category_id = 6').where.not('priority_id = 3')
    @projects_home = Project.all.reverse_order.where('category_id = 6').where('priority_id = 3')
    render :index
  end
end
