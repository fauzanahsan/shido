ActiveAdmin.register Category do
  menu :parent => "Businesses", :if => proc{ can?(:manage, Category) }
  controller.authorize_resource
  
  filter :name, :label => "Category Name"
  
end
