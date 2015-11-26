ActiveAdmin.register Subcategory do
	menu :if => proc{ can?(:manage, 'Admin' ) }
	form do |f|
		f.inputs 'Sub Category' do
		  f.semantic_errors
		  f.input :title, :require => true
		  f.input :category_id, :as => :select2, :collection => Category.all, :include_blank => false, :require => true
		  f.input :combination, :as => :select2, :collection => Category.all, :include_blank => false, :require => true
		end
		f.actions
	end
end
