ActiveAdmin.register User do
  #menu :if => proc{ can?(:manage, 'User' ) }
  permit_params :email, :name, :password, :password_confirmation, :role, as: :admin

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :name
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  show do |p|
    attributes_table do
      row :id
      row :email
      row :name
      row :role
    end
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, :collection => ['user', 'moderator', 'admin'], :include_blank => false
    end
    f.actions
  end

end
