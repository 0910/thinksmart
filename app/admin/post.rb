ActiveAdmin.register Post do

  permit_params :title, :project_type_id, :description, :benefit, :solved_problems, :target_id, :category_id, :link, :city_id, :user_id

  form do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :title, :require => true
      f.input :project_type_id, :as => :select, :collection => ProjectType.all, :include_blank => false, :require => true
      f.input :category_id, :as => :select, :collection => Category.all, :include_blank => false, :require => true
      f.input :target_id, :as => :select, :collection => Target.all, :include_blank => false, :require => true
      f.input :city_id, :as => :select, :collection => City.all, :include_blank => false, :require => true
      f.input :description, :require => true
      f.input :benefit, :require => true
      f.input :solved_problems, :require => true
    end
    f.actions
  end


end