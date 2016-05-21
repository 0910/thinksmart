class AppsController < ApplicationController
  def index
    @apps = App.all
    @categories = Category.all
  end
  def show
  	@app = App.friendly.find(params[:id])
    @previous = App.where("id < ?", params[:id]).order(:id).first   
    @next = App.where("id > ?", params[:id]).order(:id).first 
    @categories = Category.all
  end
  def transport
    @transport = true
    @apps = App.where('category_id = 1').where.not('priority_id = 3')
    @apps = App.all.reverse_order.where('category_id = 1')
    render :index
  end
  def development
    @development = true
    @apps = App.all.reverse_order.where('category_id = 2')
    render :index
  end
  def environment
    @environment = true
    @apps = App.all.reverse_order.where('category_id = 3')
    render :index
  end
  def people
    @people = true
    @apps = App.all.reverse_order.where('category_id = 4')
    render :index
  end
  def community
    @community = true
    @apps = App.all.reverse_order.where('category_id = 5')
    render :index
  end
  def innovation
    @innovation = true
    @apps = App.all.reverse_order.where('category_id = 6')
    render :index
  end
end
