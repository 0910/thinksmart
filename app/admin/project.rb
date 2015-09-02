ActiveAdmin.register Project do

  #permit_params :title, :project_type_id, :description, :benefit, :solved_problems, :image_attributes, :target_id, :category_id, :link, :city_id, :user_id

  before_create do |project|
    project.user = current_user
  end

  index do
    column :id
    column :title
    column :category_id
    column :user
    actions
  end
  
  show do |p|
    attributes_table do
      row :title
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
      f.input :project_type_id, :as => :select, :collection => ProjectType.all, :include_blank => false, :require => true
      f.input :category_id, :as => :select, :collection => Category.all, :include_blank => false, :require => true
      f.input :target_id, :as => :select, :collection => Target.all, :include_blank => false, :require => true
      f.input :city_id, :as => :select, :collection => City.all, :include_blank => false, :require => true
      f.input :description, :require => true
      f.input :benefit, :require => true
      f.input :solved_problems, :require => true
    end
    f.inputs "Images" do
      f.has_many :images do |i|
        i.input :file, as: :file, hint: i.object.new_record? ? i.template.content_tag(:span, "No Image Yet") : image_tag(i.object.file.url(:thumb))
        i.input :_destroy, as: :boolean, label: "Destroy?" unless i.object.new_record?
      end 
    end
    f.actions
  end


end
