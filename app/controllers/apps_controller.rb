class AppsController < ApplicationController
  def index
    @apps = App.all
  end
  def show
  	@app = App.find(params[:id])
    @targets = Target.find(params[:id])
    @previous = App.where("id < ?", params[:id]).order(:id).first   
    @next = App.where("id > ?", params[:id]).order(:id).first 
  end
end
