ActiveAdmin.register City do
  menu :if => proc{ can?(:manage, 'Admin' ) }
  #permit_params :name, :population, :man, :woman, :ranking, :smart_index, :visitors, :commitment
  
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end 
  
  index do
    column :id
    column :name
    column :country
    column :created_at
    column :updated_at
    translation_status
    actions
  end

  show do |p|
    attributes_table do
      row :name
      row :country
      row :slug
      row :title
      row :subtitle
      row :population
      row :man
      row :woman
      row :ranking
      row :smart_index
      row :visitors
      row :commitment
      p.images.each do |image|
        row :images do
          image_tag(image.file.url(:thumb))
        end
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :country, :require => true
      f.input :latitude, :require => true
      f.input :longitude, :require => true
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :title, :require => true
        t.input :subtitle, :require => true
      end
      f.input :population, :require => true
      f.input :man, :require => true
      f.input :woman, :require => true
      f.input :ranking, :require => true
      f.input :smart_index, :require => true
      f.input :visitors, :require => true
      f.input :commitment, :require => true
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
