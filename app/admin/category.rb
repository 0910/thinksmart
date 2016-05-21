ActiveAdmin.register Category do
  menu :if => proc{ can?(:manage, 'Admin' ) }

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end 

  index do
    column :id
    column :name
    actions
  end

  show do |p|
    attributes_table do
      row :name
      row :description
      row :slug
      row :image do
        image_tag(category.image.url(:thumb))
      end
    end
  end
  
  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :name, :require => true
        t.input :description, :require => true
      end
    end
    f.inputs "Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end


end
