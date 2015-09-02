ActiveAdmin.register Subcategory do

  form do |f|
    f.inputs 'Sub Category' do
      f.semantic_errors
      f.input :title, :require => true
      f.input :category_id, :as => :select, :collection => Category.all, :include_blank => false, :require => true
      f.input :combination, :as => :select, :collection => Category.all, :include_blank => false, :require => true
    end
    f.actions
  end

end
