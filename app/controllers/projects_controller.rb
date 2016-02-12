class ProjectsController < ApplicationController
  
  def index
  	@projects = Project.all.reverse_order.where.not('priority_id = 3')
    @projects_home = Project.all.reverse_order.where('priority_id = 3')
  end

  def show
    @hide_city_menu = true
  	@project = Project.find(params[:id])
    @targets = Target.joins(:project_targets).where(:project_targets => {:proyect_id => @proyect})
    @previous = Project.where("id < ?", params[:id]).order(:id).first   
    @next = Project.where("id > ?", params[:id]).order(:id).first 
  end

  def new
    @hide_city_menu = true
    @cat_menu_alt = true
    @cities = City.all
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    redirect_to @project
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to @project
  end

  def edit
    @hide_city_menu = true
    @project = Project.find(params[:id])
    @targets = Target.joins(:project_targets).where(:project_targets => {:proyect_id => @proyect})
  end

  def transport
    @transport = true
    @projects = Project.where('category_id = 1').where.not('priority_id = 3')
    @projects_home = Project.all.reverse_order.where('category_id = 1').where('priority_id = 3')
    render :index
  end
  def development
    @development = true
    @projects = Project.where('category_id = 2').where.not('priority_id = 3')
    @projects_home = Project.all.reverse_order.where('category_id = 2').where('priority_id = 3')
    render :index
  end
  def environment
    @environment = true
    @projects = Project.where('category_id = 3').where.not('priority_id = 3')
    @projects_home = Project.all.reverse_order.where('category_id = 3').where('priority_id = 3')
    render :index
  end
  def people
    @people = true
    @projects = Project.where('category_id = 4').where.not('priority_id = 3')
    @projects_home = Project.all.reverse_order.where('category_id = 4').where('priority_id = 3')
    render :index
  end
  def community
    @community = true
    @projects = Project.where('category_id = 5').where.not('priority_id = 3')
    @projects_home = Project.all.reverse_order.where('category_id = 5').where('priority_id = 3')
    render :index
  end
  def innovation
    @innovation = true
    @projects = Project.where('category_id = 6').where.not('priority_id = 3')
    @projects_home = Project.all.reverse_order.where('category_id = 6').where('priority_id = 3')
    render :index
  end

  private 
  def project_params
    params.require(:project).permit(:title, :project_type_id, :description, :benefit, :solved_problems, :category_id, :link, :city_id, {:target_ids => []}).merge(user_id: current_user.id)
  end
end
