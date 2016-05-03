ActiveAdmin.register Category do
  menu :if => proc{ can?(:manage, 'Admin' ) }

  index do
    column :id
    column :name
    actions
  end

  show do |p|
    attributes_table do
      row :name
      row :description
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
    f.actions
  end


end
