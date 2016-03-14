ActiveAdmin.register App do

  #permit_params :title, :project_type_id, :description, :benefit, :solved_problems, :target_id, :category_id, :link, :city_id, :user_id

  controller do
    def scoped_collection
      if current_user.moderator?
        current_user.apps
      else
        App
      end
    end
  end

  before_create do |app|
    app.user = current_user
  end

  index do
    column :id
    column :name
    column :user
    actions
  end

  show do |p|
    attributes_table do
      row :title
      row :description
      row :benefit
      row :solved_problems
      row :targets do 
        app.targets.collect.each do |t|
          t.name
        end
      end
      row :apple
      row :android
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
      f.input :name, :require => true
      f.input :targets, :as => :select, :collection => Target.all, :include_blank => false, :require => true, :multiple => true
      f.input :city_id, :as => :select2, :collection => City.all, :include_blank => false, :require => true
      f.input :description, :require => true
      f.input :benefit, :require => true
      f.input :solved_problems, :require => true
      f.input :apple
      f.input :android
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