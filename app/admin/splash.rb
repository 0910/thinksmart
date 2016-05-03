ActiveAdmin.register Splash do

  #permit_params :title, :project_type_id, :description, :benefit, :solved_problems, :target_id, :category_id, :link, :city_id, :user_id


  index do
    column :id
    column :title
    column :user
    translation_status
    actions
  end

  show do |p|
    attributes_table do
      row :title
      row :subtitle
      row :call_to_action
      row :link
      row :image do
        image_tag(splash.image.url(:thumb))
      end
    end
  end
  
  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :title, :require => true
        t.input :subtitle, :require => true
        t.input :call_to_action, :require => true
      end
      f.input :link
    end
    f.inputs "Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end


end