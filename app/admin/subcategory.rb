ActiveAdmin.register Subcategory do
	menu :if => proc{ can?(:manage, 'Admin' ) }
	index do
	    column :id
	    column :title
	    actions
	end
	show do |p|
	    attributes_table do
	      row :id
	      row :title
	      row :category
	      row :created_at
	      row :updated_at
	    end
	  end
	form do |f|
		f.inputs 'Sub Category' do
		  f.semantic_errors
		  f.input :title, :require => true
		  f.input :category_id, :as => :select2, :collection => Category.all, :include_blank => false, :require => true
		end
		f.actions
	end
end
