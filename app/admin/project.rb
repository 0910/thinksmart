ActiveAdmin.register Project do

  #permit_params :title, :project_type_id, :description, :benefit, :solved_problems, :image_attributes, :target_id, :category_id, :link, :city_id, :user_id
  
  controller do
    def scoped_collection
      if current_user.moderator?
        current_user.projects
      else
        Project
      end
    end
  end

  before_create do |project|
    project.user = current_user
  end

  index do
    column :id
    column :title
    column :category
    column :city
    column :priority
    column :user
    actions
  end
  
  show do |p|
    attributes_table do
      row :title
      row :subtitle
      row :description
      row :city
      row :benefit
      row :solved_problems
      row :targets do 
        project.targets.collect.each do |t|
          t.name
        end
      end
      row :category
      row :subcategories do 
        project.subcategories.collect.each do |s|
          s.title
        end
      end
      row :priority
      row :status
      row :advance
      row :link
      row :user
      p.images.each do |image|
        row :image do
          image_tag(image.file.url(:thumb))
        end
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :title, :require => true
      f.input :subtitle, :require => true
      f.input :status, as: :select2, :collection => ['pending', 'aproved', 'rejected'], :include_blank => false
      f.input :advance
      f.input :project_type_id, :as => :select2, :collection => ProjectType.all, :include_blank => false, :require => true
      f.input :category_id, :as => :select2, :collection => Category.all, :include_blank => false, :require => true      
      f.input :subcategories, :as => :select, :collection => option_groups_from_collection_for_select(Category.all, :subcategories, :name, :id, :title), :multiple => true
      f.input :phase_id, :as => :select2, :collection => Phase.all, :include_blank => false, :require => true
      f.input :priority, :as => :select2, :collection => Priority.all, :include_blank => false, :require => true
      f.input :targets, :as => :select, :collection => Target.all, :include_blank => false, :require => true, :multiple => true
      f.input :city_id, :as => :select2, :collection => City.all, :include_blank => false, :require => true
      f.input :description, :require => true
      f.input :benefit
      f.input :solved_problems
      f.input :link
    end
    f.inputs "Images" do
      f.has_many :images do |i|
        i.input :file, as: :file, label: false, hint: i.object.new_record? ? i.template.content_tag(:span, "No Image Yet") : image_tag(i.object.file.url(:thumb))
        i.input :cover, as: :boolean, label: "Cover"
        i.input :_destroy, as: :boolean, label: "Destroy?" unless i.object.new_record?
      end 
    end
    f.actions
  end
end
