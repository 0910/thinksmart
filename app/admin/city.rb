ActiveAdmin.register City do
  menu :if => proc{ can?(:manage, 'Admin' ) }
  #permit_params :name, :population, :man, :woman, :ranking, :smart_index, :visitors, :commitment
  
  show do |p|
    attributes_table do
      row :name
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
      f.input :slug, :require => true
      f.input :latitude, :require => true
      f.input :longitude, :require => true
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
