class SubcategoriesController < ApplicationController
  respond_to :json

  def index
    if params[:category_id]
      category = category.find_by_id(params[:category_id])
      @subcategories = category.subcategories
    else
      @subcategories = Category.all
    end
    render :json => @subcategories.collect {|subcategory| {:id => subcategory.id, :name => subcategory.attr_name} }
  end
end
