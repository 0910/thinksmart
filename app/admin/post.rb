ActiveAdmin.register Post do

  #permit_params :title, :project_type_id, :description, :benefit, :solved_problems, :target_id, :category_id, :link, :city_id, :user_id

  controller do
    def scoped_collection
      if current_user.moderator?
        current_user.posts
      else
        Post
      end
    end
  end

  before_create do |post|
    post.user = current_user
  end

  index do
    column :id
    column :title
    column :category_id
    column :priority
    column :user
    actions
  end

  show do |p|
    attributes_table do
      row :title
      row :project_type
      row :description
      row :benefit
      row :solved_problems
      row :targets do 
        post.targets.collect.each do |t|
          t.name
        end
      end
      row :category
      row :priority
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
      f.input :project_type_id, :as => :select2, :collection => ProjectType.all, :include_blank => false, :require => true
      f.input :category_id, :as => :select2, :collection => Category.all, :include_blank => false, :require => true
      f.input :priority, :as => :select2, :collection => Priority.all, :include_blank => false, :require => true
      f.input :targets, :as => :select2_multiple, :collection => Target.all, :include_blank => false, :require => true
      f.input :city_id, :as => :select2, :collection => City.all, :include_blank => false, :require => true
      f.input :priority, :as => :select2, :collection => Priority.all, :include_blank => false, :require => true
      f.input :description, :require => true
      f.input :benefit, :require => true
      f.input :solved_problems, :require => true
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