ActiveAdmin.register Sponsor do


  index do
    column :id
    column :name
    column :description
    column :link
    actions
  end
  
  show do |p|
    attributes_table do
      row :id
      row :name
      row :description
      row :link
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :description
      f.input :link
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
  end
end
